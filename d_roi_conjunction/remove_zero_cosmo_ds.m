function [clean_ds,num_vox] = remove_zero_cosmo_ds(input_ds)

NumRuns=size(input_ds.samples,1)/4;



indx=all(input_ds.samples~=0);

num_vox=sum(indx);

clean_ds=input_ds;

clean_ds.samples=clean_ds.samples(:,indx);

clean_ds.fa.i=clean_ds.fa.i(1,indx);
clean_ds.fa.j=clean_ds.fa.j(1,indx);
clean_ds.fa.k=clean_ds.fa.k(1,indx);

end