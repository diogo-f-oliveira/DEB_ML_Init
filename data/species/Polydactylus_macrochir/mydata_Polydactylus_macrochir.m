function [data, auxData, metaData, txtData, weights] = mydata_Polydactylus_macrochir
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Polynemiformes'; 
metaData.family     = 'Polynemidae';
metaData.species    = 'Polydactylus_macrochir'; 
metaData.species_en = 'King threadfin'; 

metaData.ecoCode.climate = {'MA', 'Aw', 'Cfa'};
metaData.ecoCode.ecozone = {'MPSW', 'MIN', 'TA'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd', 'jiFr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mdc'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'; 'L-Ww'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2019 01 10]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 01 10]; 

%% set data
% zero-variate data

data.am = 22*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'MoorSimp2012';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 25; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
  comment.Lp = 'guess based on Li, relative to family memeber';
data.Li  = 170;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 2.4e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.775 mm: pi/6*0.0775^3'; 
data.Wwi  = 45e3;  units.Wwi  = 'g';  label.Wwi  = 'ultimate weight'; bibkey.Wwi  = 'fishbase';

data.Ri = 2.5e7/365;  units.Ri = '#/d';  label.Ri = 'reprod rate';  bibkey.Ri = 'guess';
  temp.Ri = C2K(28); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on kap = 0.8';

% uni-variate data
% time-length data 
data.tL_Eig = [ ... % time since birth (yr), fork length (cm)
0.517	23.014
0.517	24.452
1.487	34.041
1.487	35.959
1.487	37.397
1.552	39.315
1.552	42.192
2.522	35.959
2.522	42.671
2.522	44.589
2.522	46.507
2.522	47.945
2.522	49.863
2.522	56.096
2.522	55.616
2.554	52.740
3.460	49.863
3.460	52.740
3.492	57.534
3.492	59.932
3.492	62.329
3.492	64.726
3.492	66.644
3.492	68.562
3.492	73.356
3.524	63.288
4.462	64.247
4.462	67.123
4.462	81.507
4.462	88.219
4.462	90.616
4.494	70.959
4.527	46.986
5.464	94.452
5.497	87.260
5.497	88.699
5.497	92.055
6.467	90.137
6.467	92.055
6.467	94.932
6.564	98.288
7.501	89.658
7.501	93.493
8.503	96.849
8.503	98.288
8.536	90.616
8.536	94.932
9.506	88.219
9.538	90.137
9.538	94.452
9.538	97.329
9.538	99.247
9.538	107.397
10.476	92.055
10.476	97.808
10.476	99.247
10.476	101.644
11.510	99.726];
data.tL_Eig(:,1) = 365 * data.tL_Eig(:,1);  % convert yr to d
units.tL_Eig   = {'d', 'cm'};  label.tL_Eig = {'time since birth', 'fork length', 'Eighty Mile Beach'};  
temp.tL_Eig    = C2K(28);  units.temp.tL_Eig = 'K'; label.temp.tL_Eig = 'temperature';
bibkey.tL_Eig = 'MoorSimp2012';
comment.tL_Eig = 'Data for Eighty Mile Beach';
%
data.tL_Roe = [ ... % time since birth (yr), fork length (cm)
1.426	51.123
1.426	53.537
1.426	54.020
1.426	55.951
1.426	58.847
1.458	47.743
1.458	49.674
1.815	54.489
1.815	55.455
1.815	56.903
1.815	58.834
1.815	59.317
1.815	62.696
1.847	45.316
1.847	47.729
1.847	49.660
1.847	50.626
1.847	52.074
2.366	70.884
2.366	72.332
2.431	69.916
2.431	76.675
2.431	77.640
2.463	65.087
2.463	67.501
2.463	68.950
2.495	58.328
2.495	61.224
2.495	62.673
2.819	72.799
2.819	74.730
2.852	53.488
2.852	56.384
2.852	59.281
2.852	61.212
2.852	62.660
2.852	64.109
2.852	67.005
2.852	67.488
2.852	69.419
2.852	70.867
3.403	77.607
3.403	80.503
3.403	82.434
3.921	82.899
4.472	81.915
4.472	84.811
4.829	82.868
5.444	86.709
5.509	82.362
6.514	82.327
6.870	87.142
7.421	82.779
7.454	80.846
7.454	85.674
7.454	88.571
8.426	82.744
8.426	84.675
8.426	88.054];
data.tL_Roe(:,1) = 365 * data.tL_Roe(:,1);  % convert yr to d
units.tL_Roe   = {'d', 'cm'};  label.tL_Roe = {'time since birth', 'fork length', 'Roebuck Bay'};  
temp.tL_Roe    = C2K(28);  units.temp.tL_Roe = 'K'; label.temp.tL_Roe = 'temperature';
bibkey.tL_Roe = 'MoorSimp2012';
comment.tL_Roe = 'Data for Roebuck Bay';
%
data.tL_Der = [ ... % time since birth (yr), fork length (cm)
0.582	21.724
1.520	40.552
1.940	35.241
1.940	37.655
1.940	40.069
1.940	43.931
1.940	45.862
2.490	44.897
2.490	58.897
2.490	60.828
2.522	50.207
2.522	53.103
2.975	47.310
2.975	49.241
2.975	59.379
3.524	55.034
3.524	62.759
3.524	63.724
3.524	65.655
3.524	68.552
3.524	79.655
3.557	75.310
4.494	85.931
4.494	87.862
4.494	90.276
5.432	85.448
5.432	87.862
5.497	90.759
5.529	93.172
5.529	96.069
6.564	93.655
7.469	89.793
7.501	92.207
7.566	98.483
8.536	87.379
9.506	103.310];
data.tL_Der(:,1) = 365 * data.tL_Der(:,1);  % convert yr to d
units.tL_Der   = {'d', 'cm'};  label.tL_Der = {'time since birth', 'fork length', 'Derby'};  
temp.tL_Der    = C2K(28);  units.temp.tL_Der = 'K'; label.temp.tL_Der = 'temperature';
bibkey.tL_Der = 'MoorSimp2012';
comment.tL_Der = 'Data for Derby';
%
data.tL_Cha = [ ... % time since birth (yr), fork length (cm)
1.620	49.065
1.620	52.927
2.366	77.039
2.560	59.653
2.560	61.584
2.560	63.032
2.560	64.481
2.560	65.446
2.593	55.307
2.593	56.755
2.593	66.411
2.593	69.307
2.593	71.238
2.593	72.204
3.435	83.278
3.565	84.239
3.597	64.445
3.597	67.341
3.597	69.755
3.597	72.169
3.597	74.583
3.597	74.583
3.597	75.548
3.597	77.479
4.343	71.661
4.343	73.592
4.343	79.385
4.343	81.799
4.602	72.134
4.602	79.859
4.634	83.237
5.347	73.557
5.347	76.454
5.574	78.377
6.417	94.761
7.324	86.523
7.389	92.797
7.389	95.693
8.361	89.867
8.361	92.763
8.361	96.143
9.333	90.316
9.333	91.764
9.333	93.695
9.366	101.418
10.338	87.385
10.338	88.833
10.370	90.763
10.370	92.694
10.370	94.142
10.370	95.108
10.370	98.004
11.407	89.762
11.407	92.658
11.407	95.072
11.407	96.520
11.407	97.969];
data.tL_Cha(:,1) = 365 * data.tL_Cha(:,1);  % convert yr to d
units.tL_Cha   = {'d', 'cm'};  label.tL_Cha = {'time since birth', 'fork length', 'Chambers Bay'};  
temp.tL_Cha    = C2K(28);  units.temp.tL_Cha = 'K'; label.temp.tL_Cha = 'temperature';
bibkey.tL_Cha = 'MoorSimp2012';
comment.tL_Cha = 'Data for Chambers Bay';
%
data.tL_Rop = [ ... % time since birth (yr), fork length (cm)
1.594	48.328
2.641	58.242
2.820	55.583
3.570	72.606
3.571	75.283
3.571	76.621
3.572	78.406
3.602	79.747
3.602	81.531
4.558	82.961
4.558	84.299
4.559	86.083
4.587	80.733
4.589	87.425
4.650	91.891
4.859	91.911
4.861	100.834
5.634	87.971
5.634	90.201
5.635	91.540
5.635	91.986
5.635	93.324
5.635	95.108
5.636	96.001
5.636	97.785
5.637	99.569
5.753	88.874
5.754	89.766
5.785	97.353
6.590	93.415
6.591	94.754
6.591	96.092
6.591	97.430
6.620	91.634
6.621	98.771
6.622	101.002
7.606	97.527
7.667	100.210
7.789	110.481
8.774	110.130
10.624	108.522];
data.tL_Rop(:,1) = 365 * data.tL_Rop(:,1);  % convert yr to d
units.tL_Rop   = {'d', 'cm'};  label.tL_Rop = {'time since birth', 'fork length', 'Roper River'};  
temp.tL_Rop    = C2K(28);  units.temp.tL_Rop = 'K'; label.temp.tL_Rop = 'temperature';
bibkey.tL_Rop = 'MoorSimp2012';
comment.tL_Rop = 'Data for Roper River';
%
data.tL_Fli = [ ... % time since birth (yr), fork length (cm)
1.474	32.565
1.475	34.349
1.505	36.134
1.506	38.810
2.406	48.625
2.406	51.747
2.436	52.639
2.467	56.208
2.915	50.855
2.915	51.747
2.916	54.870
2.916	57.546
2.917	58.885
2.917	60.669
2.917	62.007
2.949	68.253
2.950	73.160
3.484	54.424
3.485	58.885
3.485	60.223
3.491	82.528
3.491	83.866
3.492	85.651
3.492	86.989
3.494	93.234
3.513	51.301
3.514	55.762
3.514	57.100
3.516	62.007
3.516	63.346
3.518	69.591
3.518	71.375
3.519	73.606
3.519	74.944
3.519	76.283
3.547	66.914
3.550	78.959
3.550	79.851
3.903	53.978
3.903	57.546
3.904	61.115
3.905	62.900
3.905	63.792
3.905	65.130
3.906	66.468
3.906	68.253
3.907	70.037
3.908	74.052
3.908	77.621
4.471	56.208
4.505	70.483
4.506	72.714
4.506	74.944
4.538	82.528
4.539	86.989
4.539	87.881
4.540	90.558
4.861	57.993
4.897	81.190
4.898	86.543
4.924	71.822
4.925	74.052
5.461	66.468
5.463	71.822
5.527	91.450
5.553	75.390
5.556	86.097
5.886	91.004
5.942	73.606
6.478	64.238
7.437	72.268];
data.tL_Fli(:,1) = 365 * data.tL_Fli(:,1);  % convert yr to d
units.tL_Fli   = {'d', 'cm'};  label.tL_Fli = {'time since birth', 'fork length', 'Flinders River'};  
temp.tL_Fli    = C2K(28);  units.temp.tL_Fli = 'K'; label.temp.tL_Fli = 'temperature';
bibkey.tL_Fli = 'MoorSimp2012';
comment.tL_Fli = 'Data for Flinders River';
%
data.tL_Spr = [ ... % time since birth (yr), fork length (cm)
1.516	39.556
1.516	42.222
1.546	29.333
1.546	31.556
1.546	33.333
2.497	40.000
2.497	42.222
2.497	44.444
2.497	47.111
2.497	51.556
2.497	55.111
2.497	60.000
2.527	35.111
2.527	49.333
3.478	48.444
3.478	50.667
3.478	60.444
3.478	62.667
3.478	87.556
3.478	91.556
3.507	58.222
3.507	61.778
3.507	64.889
3.507	67.111
3.507	77.778
3.537	72.889
3.537	75.111
3.537	76.000
3.567	55.111
3.567	56.889
3.597	70.667
4.459	82.222
4.488	61.778
4.488	64.000
4.488	66.667
4.488	67.556
4.488	68.889
4.488	71.111
4.488	71.556
4.488	75.111
4.488	77.778
4.488	84.000
4.488	84.889
4.488	86.222
4.488	88.444
5.469	60.889
6.539	93.778
8.501	70.667
8.590	103.111];
data.tL_Spr(:,1) = 365 * data.tL_Spr(:,1);  % convert yr to d
units.tL_Spr   = {'d', 'cm'};  label.tL_Spr = {'time since birth', 'fork length', 'Spring Creek'};  
temp.tL_Spr    = C2K(28);  units.temp.tL_Spr = 'K'; label.temp.tL_Spr = 'temperature';
bibkey.tL_Spr = 'MoorSimp2012';
comment.tL_Spr = 'Data for Spring Creek';
%
data.tL_Fit = [ ... % time since birth (yr), fork length (cm)
1.638	47.111
1.638	49.778
1.638	55.111
1.638	57.778
1.685	52.444
1.685	60.444
1.685	62.667
1.872	48.000
1.919	60.889
1.919	64.000
1.919	66.222
1.966	49.778
1.966	55.556
2.013	43.111
2.013	44.444
2.013	51.556
2.247	44.889
2.247	48.000
2.247	51.111
2.340	57.778
2.434	67.111
2.434	70.667
2.528	54.222
2.528	68.444
2.528	74.222
2.621	56.444
2.621	60.444
2.621	72.889
2.668	62.667
2.668	65.333
2.809	59.556
2.902	62.222
2.902	65.333
2.902	72.444
2.902	76.444
2.902	78.667
2.949	74.667
2.949	77.778
2.949	80.000
2.949	83.556
2.996	52.444
2.996	54.667
2.996	56.889
2.996	58.667
2.996	68.000
2.996	70.222
2.996	71.111
2.996	88.444
2.996	90.222
3.277	59.111
3.323	82.222
3.370	62.667
3.370	64.889
3.370	65.778
3.370	68.444
3.370	71.111
3.370	85.333
3.370	90.222
3.417	73.778
3.417	78.222
3.464	81.333
3.464	81.778
3.464	86.667
3.464	88.889
3.464	89.333
3.557	72.889
3.557	74.667
3.557	76.444
3.557	76.889
3.557	80.000
3.604	80.000
3.791	81.333
3.838	83.556
3.885	67.111
3.885	68.889
3.885	72.444
3.885	86.667
3.885	92.444
3.885	94.222
3.932	59.111
3.932	61.778
3.932	64.000
3.932	66.222
3.932	79.111
3.932	92.000
3.932	95.556
3.932	98.222
3.979	75.556
3.979	76.444
3.979	83.111
3.979	86.667
3.979	90.667
4.026	71.556
4.026	74.667
4.260	81.333
4.306	83.556
4.306	85.333
4.306	88.889
4.400	76.444
4.400	80.000
4.447	73.778
4.494	82.667
4.494	93.333
4.681	75.111
4.728	83.556
4.774	67.111
4.868	74.667
4.868	87.111
4.868	88.889
4.868	92.444
4.915	84.444
4.915	83.111
4.915	96.000
4.962	72.000
4.962	95.556
4.962	97.333
4.962	104.000
5.009	100.889
5.009	102.222
5.055	71.111
5.055	74.222
5.055	77.333
5.055	92.444
5.055	99.111
5.055	106.222
5.243	86.222
5.289	74.222
5.430	92.889
5.430	99.556
5.523	86.222
5.617	106.667
5.664	99.556
5.664	101.333
5.711	83.556
5.804	84.889
5.898	77.778
5.898	81.333
5.898	100.889
5.898	104.444
5.945	83.111
5.945	88.000
5.945	94.222
5.991	84.444
5.991	106.222
5.991	107.556
5.991	108.444
5.991	110.222
5.991	112.444
5.991	115.556
6.038	112.000
6.038	119.111
6.740	105.778
6.881	108.444
6.881	115.556
6.928	80.889
6.928	83.556
6.928	100.000
6.974	110.667
7.021	104.000
7.396	101.333
7.770	104.889
7.957	112.444
7.957	115.556
7.957	119.111
8.004	92.000
8.098	110.222
8.613	105.333
8.660	119.111
8.800	111.556
8.847	104.444
8.987	108.000
8.987	112.000
8.987	117.333
9.034	124.444
10.017	117.333
10.017	119.556
10.017	120.889
10.485	117.333
11.000	119.111
11.983	108.444
12.030	135.111
12.919	113.778
13.106	121.333
13.902	118.222
15.915	105.778
16.009	117.333
16.898	110.222
16.898	114.667
18.911	114.667
18.957	108.444
18.957	118.222
19.051	112.444
19.847	111.111
19.847	116.889
19.894	119.111
20.970	118.667
20.970	120.889
20.970	122.667
21.064	128.000
22.000	113.333];
data.tL_Fit(:,1) = 365 * data.tL_Fit(:,1);  % convert yr to d
units.tL_Fit   = {'d', 'cm'};  label.tL_Fit = {'time since birth', 'fork length', 'Fitzroy River'};  
temp.tL_Fit    = C2K(28);  units.temp.tL_Fit = 'K'; label.temp.tL_Fit = 'temperature';
bibkey.tL_Fit = 'MoorSimp2012';
comment.tL_Fit = 'Data for Fitzroy River';
%
data.tL_Mar = [ ... % time since birth (yr), fork length (cm)
2.041	44.175
2.480	51.855
2.996	54.148
2.996	56.841
2.996	61.456
3.100	58.376
3.151	65.683
3.280	71.064
3.280	74.141
3.384	61.830
3.384	73.753
3.384	75.292
3.410	69.522
3.487	72.981
3.720	75.667
3.797	77.203
3.797	78.742
3.849	75.663
3.926	74.123
4.339	79.881
4.339	81.804
4.391	78.341
4.494	72.953
4.701	76.409
4.727	79.101
4.727	81.409
5.011	81.785
5.011	83.324
5.037	79.862
5.631	79.845
5.760	90.611
5.812	94.071
5.838	82.917
5.863	87.147
5.889	92.146
6.354	93.672
6.690	90.585
6.742	92.122
6.742	94.815
6.897	84.811
6.923	96.348
6.923	86.733
7.827	83.631
7.827	88.631
8.033	99.779
9.790	91.270
10.771	93.935
10.823	99.703
10.875	97.778
10.926	101.623];
data.tL_Mar(:,1) = 365 * data.tL_Mar(:,1);  % convert yr to d
units.tL_Mar   = {'d', 'cm'};  label.tL_Mar = {'time since birth', 'fork length', 'Mary River'};  
temp.tL_Mar    = C2K(28);  units.temp.tL_Mar = 'K'; label.temp.tL_Mar = 'temperature';
bibkey.tL_Mar = 'MoorSimp2012';
comment.tL_Mar = 'Data for Mary River';
%
data.tL_Bri = [ ... % time since birth (yr), fork length (cm)
1.889	53.261
2.381	50.217
2.407	54.783
2.510	70.000
2.510	73.424
2.769	56.304
2.924	60.870
3.079	62.011
3.390	67.337
3.571	78.370
3.752	75.707
3.804	68.859
3.856	72.663
3.856	72.283
3.856	73.804
3.856	76.087
3.882	79.130
3.985	80.272
3.985	63.913
4.037	87.500
4.166	70.380
4.166	74.565
4.166	82.174
4.218	79.130
4.218	80.652
4.218	84.076
4.218	86.739
4.270	78.750
4.425	85.978
4.477	73.804
4.580	80.272
4.606	78.370
4.813	73.804
4.943	70.000
4.969	77.228
4.969	80.652
4.969	85.217
5.098	77.228
5.305	89.402
5.305	92.446
5.616	89.783
5.797	91.685
6.030	89.022
6.030	85.217
6.030	83.696
6.159	91.304
6.159	96.250
6.444	90.924
6.444	89.022
6.444	85.217
6.470	96.250
6.547	93.587
6.832	88.261
6.858	82.935
6.961	89.402
7.013	93.587
7.065	91.685
7.065	98.913
7.349	98.913
7.479	101.576
8.617	103.478
10.429	95.870
10.481	92.826
10.481	101.576
10.558	100.435
10.713	101.576
10.791	101.576
10.791	103.478
10.791	105.000
10.791	97.011
10.895	95.870];
data.tL_Bri(:,1) = 365 * data.tL_Bri(:,1);  % convert yr to d
units.tL_Bri   = {'d', 'cm'};  label.tL_Bri = {'time since birth', 'fork length', 'Brisbane River'};  
temp.tL_Bri    = C2K(28);  units.temp.tL_Bri = 'K'; label.temp.tL_Bri = 'temperature';
bibkey.tL_Bri = 'MoorSimp2012';
comment.tL_Bri = 'Data for Brisbane River';

%% set weights for all real data
weights = setweights(data, []);
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_Eig','tL_Roe','tL_Der','tL_Cha','tL_Rop'}; subtitle1 = {'Data for loc Eig, Roe, Der, Cha, Rop'};
set2 = {'tL_Fli','tL_Spr','tL_Fit','tL_Mar','tL_Bri'}; subtitle2 = {'Data for loc Fli, Spr, Fit, Mar, Bri'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Locations are assumed to vary in food availebility, not in guessed temperatures';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Marine; freshwater; brackish; demersal; catadromous';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'protandrous hermaphrodite (first male, then female)';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '4L59P'; % Cat of Life
metaData.links.id_ITIS = '645493'; % ITIS
metaData.links.id_EoL = '46578845'; % Ency of Life
metaData.links.id_Wiki = 'Polydactylus_macrochir'; % Wikipedia
metaData.links.id_ADW = 'Polydactylus_macrochir'; % ADW
metaData.links.id_Taxo = '184318'; % Taxonomicon
metaData.links.id_WoRMS = '276590'; % WoRMS
metaData.links.id_fishbase = 'Polydactylus-macrochir'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Polydactylus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MoorSimp2012'; type = 'Article'; bib = [ ... 
'author = {Bradley R. Moore and Colin A. Simpfendorfer and  Stephen J. Newman and Jason M. Stapley and Quentin Allsop and Michelle J. Sellin and David J. Welch}, ' ... 
'year = {2012}, ' ...
'title = {Spatial variation in life history reveals insight into connectivity and geographic population structure of a tropical estuarine teleost: king threadfin, \emph{Polydactylus macrochir}}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {125-126}, ' ...
'pages = {214-224}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Polydactylus-macrochir.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

