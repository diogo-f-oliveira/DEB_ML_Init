function [data, auxData, metaData, txtData, weights] = mydata_Siganus_argenteus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siganiformes'; 
metaData.family     = 'Siganidae';
metaData.species    = 'Siganus_argenteus'; 
metaData.species_en = 'Streamlined spinefoot'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiHa'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.8); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 23];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 23];

%% set data
% zero-variate data

data.am = 3*365;  units.am = 'd';    label.am = 'life span';               bibkey.am = 'fishbase';   
  temp.am = C2K(27.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 22; units.Lp  = 'cm';  label.Lp  = 'total length at puberty';   bibkey.Lp  = 'TaylGour2016'; 
data.Li  = 40;  units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 1.4e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 0.65 mm: pi/6*0.065^3'; 
data.Wwp = 146; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01413*Lp^2.99, see F1';
data.Wwi = 871.6; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01413*Li^2.99, see F1';

data.GSI = 2*0.05; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'TaylGour2016';
  temp.GSI = C2K(27.8); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on 2 spawings per yr';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.310	15.721
0.332	17.304
0.345	13.875
0.368	15.261
0.368	12.689
0.424	17.637
0.447	17.176
0.493	18.364
0.529	13.947
0.541	13.090
0.608	18.038
0.620	15.994
0.631	17.050
0.652	21.337
0.676	20.217
0.722	19.163
0.779	20.154
0.792	14.944
0.838	15.737
0.870	22.267
0.881	23.982
0.962	23.325
0.974	21.940
1.008	22.799
1.089	21.416
1.089	20.559
1.090	17.657
1.101	18.581
1.136	18.318
1.156	26.892
1.159	17.923
1.159	16.670
1.179	25.376
1.180	23.398
1.274	16.278
1.282	26.105
1.285	19.312
1.294	24.258
1.319	18.851
1.342	20.962
1.364	21.688
1.376	20.040
1.386	25.448
1.423	19.184
1.423	18.525
1.537	21.430
1.560	20.507
1.604	24.202
1.627	25.522
1.639	24.862
1.639	23.082
1.651	23.742
1.686	20.577
1.708	24.139
1.742	24.536
1.834	25.462
1.846	23.945
1.846	22.099
1.879	28.563
1.902	27.772
1.949	23.355
1.961	23.751
2.042	20.588
2.063	26.854
2.076	21.578
2.077	19.864
2.098	26.195
2.111	20.722
2.144	25.735
2.168	22.966
2.203	20.725
2.259	23.365
2.272	20.199
2.294	21.189
2.304	26.993
2.304	25.410
2.316	24.290
2.317	22.707
2.340	23.301
2.396	26.402
2.406	29.700
2.408	25.743
2.419	24.952
2.443	24.030
2.534	25.285
2.557	26.209
2.613	28.915
2.636	28.586
2.649	25.817
2.660	27.993
2.684	23.443
2.706	27.533
2.706	27.005
2.752	25.292
2.776	24.304
2.809	26.481
2.821	25.888
2.842	31.164
2.866	29.253
3.039	26.752
3.085	27.347
3.143	25.700
3.152	32.229
3.153	27.613
3.164	29.855
3.279	29.001
3.291	27.287
3.384	26.169
3.670	26.837
3.692	30.465
3.714	32.246
3.796	29.545
3.830	30.469
3.842	28.953
3.866	25.722
3.886	33.175
3.899	30.867
3.956	31.264
4.026	26.782
4.038	25.068
4.094	31.334
4.142	25.401
4.624	26.207
4.725	32.343
5.058	31.100
5.150	30.312
5.162	28.927
5.172	33.412
5.302	22.798
5.690	29.932
6.116	26.384
6.150	29.221
6.185	26.782
6.587	26.530
6.677	32.930
6.690	26.863
6.697	33.524
7.748	31.112];
data.tL_f(:,1) = 365 * (data.tL_f(:,1)+0.5);  % convert yr to d
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1);data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3;end;end
units.tL_f  = {'d','cm'};  label.tL_f = {'time since birth','total length','females'};  
temp.tL_f   = C2K(27.8);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'TaylGour2016';
comment.tL_f = 'Females from Commonwealth of the Northern Mariana Islands';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.402	14.537
0.412	19.087
0.471	15.792
0.482	16.649
0.539	17.245
0.573	18.697
0.574	16.718
0.607	19.489
0.689	14.809
0.712	15.535
0.747	14.020
0.769	16.724
0.825	20.617
0.825	19.825
0.847	22.728
0.849	18.111
0.860	19.035
0.895	16.992
0.964	17.653
0.986	20.754
0.986	18.379
0.987	16.071
1.100	23.329
1.147	19.176
1.182	17.198
1.285	18.125
1.285	17.333
1.398	23.602
1.399	19.975
1.412	17.469
1.433	22.350
1.446	19.119
1.479	21.230
1.503	19.648
1.607	17.739
1.661	27.303
1.661	25.325
1.664	18.466
1.687	19.258
1.697	21.237
1.709	22.161
1.742	26.316
1.755	20.118
1.847	20.912
1.859	20.187
1.902	26.915
1.926	24.739
1.937	25.861
1.938	22.629
1.996	21.048
2.018	22.632
2.099	23.360
2.111	19.337
2.318	19.673
2.398	19.478
2.432	23.238
2.455	22.249
2.525	19.548
2.592	23.573
2.616	20.606
2.638	24.431
2.673	22.981
2.696	21.729
2.776	22.655
3.292	26.694
3.543	28.812
3.694	25.057
3.695	23.013
3.923	27.306
4.061	25.596
4.670	26.472
4.691	30.693
4.715	27.990
5.163	27.608
5.221	26.752
5.542	26.037
5.646	26.172
5.668	28.745
5.679	27.888
5.702	29.735
5.749	26.966
6.276	30.280
6.299	28.698
6.598	28.114
6.621	29.103
6.667	28.050
6.679	25.478
6.805	27.592
6.839	29.572];
data.tL_m(:,1) = 365 * (data.tL_m(:,1)+0.5);  % convert yr to d
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1);data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3;end;end
units.tL_m  = {'d','cm'};  label.tL_m = {'time since birth','total length','males'};  
temp.tL_m   = C2K(27.8);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'TaylGour2016';
comment.tL_m = 'Males from Commonwealth of the Northern Mariana Islands';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'weight-length relationship: Ww in g = 0.01413*(TL in cm)^2.99';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Marine; brackish; reef-associated; depth range 1 - 50 m, usually 1 - 12 m. Tropical';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '6YN3X'; % Cat of Life
metaData.links.id_ITIS = '172332'; % ITIS
metaData.links.id_EoL = '46577145'; % Ency of Life
metaData.links.id_Wiki = 'Siganus_argenteus'; % Wikipedia
metaData.links.id_ADW = 'Siganus_argenteus'; % ADW
metaData.links.id_Taxo = '187592'; % Taxonomicon
metaData.links.id_WoRMS = '219686'; % WoRMS
metaData.links.id_fishbase = 'Siganus-argenteus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Siganus_argenteus}}';
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
bibkey = 'TaylGour2016'; type = 'Article'; bib = [ ... 
'doi = {10.1071/MF16169}, ' ...
'author = {Brett M. Taylor and John Gourley and Michael S. Trianni}, ' ... 
'year = {2016}, ' ...
'title = {Age, growth, reproductive biology and spawning periodicity of the forktail rabbitfish (\emph{Siganus argenteus}) from the {M}ariana {I}slands}, ' ...
'journal = {Marine and Freshwater Research}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = [...
'howpublished = {\url{http://www.fishbase.se/summary/Siganus-argenteus.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

