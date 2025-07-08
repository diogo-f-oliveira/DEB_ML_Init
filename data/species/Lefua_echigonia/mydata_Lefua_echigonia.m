  function [data, auxData, metaData, txtData, weights] = mydata_Lefua_echigonia
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Nemacheilidae';
metaData.species    = 'Lefua_echigonia'; 
metaData.species_en = 'Eight-barbel loach'; 

metaData.ecoCode.climate = {'Cfb', 'Dfa', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFm', '0iFp'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 11 09];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 11 09];

%% set data
% zero-variate data
data.am = 12*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'Aoya2007';   
  temp.am = C2K(13); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 3.7;    units.Lp = 'cm'; label.Lp = ' total length at puberty'; bibkey.Lp = 'Aoya2007';
data.Li = 7.54;    units.Li = 'cm'; label.Li = 'ultimate total length for females'; bibkey.Li = 'Aoya2007';
data.Lim = 6.12;    units.Lim = 'cm'; label.Lim = 'ultimate total length for males'; bibkey.Lim = 'Aoya2007';

data.Wwb = 2.7e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';            bibkey.Wwb = 'Aoya2007';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 0.36;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty for females';    bibkey.Wwp = {'Aoya2007','fishbase'};
  comment.Wwp = 'Based on 0.00708*Lp^3.01, see F1';
data.Wwi = 3.1; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = {'Aoya2007','fishbase'};
  comment.Wwi = 'Based on 0.00708*Li^3.01, see F1';

data.Ri = 6e3/365;   units.Ri = '#/d';  label.Ri = 'max reprod rate';    bibkey.Ri = 'guess';
  temp.Ri = C2K(13); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Barbatula barbatula';

% univariate data

% time-length
data.tL_f = [ ... % time since birth (yr), std length (cm)
0.412	0.764
0.417	0.864
0.422	0.664
0.489	1.164
0.494	0.809
0.508	0.700
0.513	0.927
0.561	1.000
0.571	1.500
0.572	1.564
0.573	1.736
0.576	1.636
0.577	1.673
0.580	0.836
0.581	1.400
0.582	1.455
0.583	1.855
0.585	0.891
0.586	0.927
0.590	1.355
0.595	1.245
0.671	2.309
0.676	2.055
0.753	2.482
0.758	2.127
0.844	2.245
0.906	2.509
0.926	2.291
1.022	2.182
1.180	2.209
1.194	2.555
1.266	2.300
1.348	2.255
1.372	2.464
1.501	2.927
1.516	2.791
1.517	2.473
1.520	3.055
1.525	2.982
1.535	2.745
1.597	2.882
1.598	2.936
1.602	2.736
1.621	3.027
1.622	3.291
1.626	3.464
1.698	3.582
1.703	2.927
1.717	3.427
1.770	3.382
1.777	3.318
1.778	3.591
1.787	3.209
1.788	3.264
1.789	3.636
1.790	3.845
1.851	3.218
1.856	3.727
1.857	3.309
1.933	3.936
2.201	3.745
2.211	3.264
2.230	3.309
2.240	3.936
2.273	3.727
2.288	3.482
2.302	3.309
2.350	3.709
2.374	3.500
2.375	3.964
2.456	3.309
2.457	3.936
2.465	3.491
2.466	3.718
2.470	3.382
2.471	3.409
2.556	3.736
2.561	3.655
2.619	4.009
2.624	3.945
2.628	4.245
2.700	4.109
2.710	4.027
2.729	3.945
2.748	4.364
2.787	3.936
2.791	4.173
2.849	4.373
2.859	4.127
2.978	4.182
2.988	4.082
3.065	4.145
3.295	4.136
3.309	4.391
3.314	3.991
3.319	4.291
3.324	4.218
3.367	3.955
3.396	4.109
3.405	4.318
3.415	4.436
3.468	4.155
3.477	3.955
3.478	4.418
3.487	4.300
3.914	5.164
3.986	4.945
3.987	4.800
3.990	4.864
3.995	4.764
4.000	5.127
4+0.412	5.245
4+0.432	4.655
4+0.441	4.418
4+0.499	5.209
4+0.523	4.964
4+0.523	4.973
4+0.590	5.164
4+1.348	4.327
4+1.367	4.473
4+1.487	4.491
4+1.535	4.345
4+1.544	4.745
4+2.269	5.291
4+2.297	4.745
4+2.345	4.982
4+2.374	5.127
4+2.384	5.291
4+2.393	4.891
4+2.398	4.645
4+2.398	4.755
4+2.451	4.682
4+2.460	4.745
4+2.460	4.818
4+2.460	5.100
4+2.470	5.227
4+2.508	4.864
4+2.571	5.209
4+3.300	5.391
4+3.319	5.164
4+3.391	5.118
4+3.400	5.391
4+3.400	5.445
4+3.405	5.182
4+3.472	5.109
4+3.477	5.182
4+3.482	5.291
4+3.487	5.400
4+3.549	5.518
4+3.899	5.682
4+3.914	5.836
4+3.923	5.555
4+3.971	5.909
4+3.990	5.445
4+3.995	5.718
4+4.010	5.518
8+0.412	5.882
8+0.422	5.573
8+0.489	6.155
8+0.499	6.664
8+0.504	6.327
8+0.508	5.573
8+1.439	6.182
8+1.444	5.836
8+1.458	5.927
8+1.472	5.627
8+1.501	5.800
8+1.511	5.964
8+1.525	5.618
8+1.525	6.355
8+1.530	5.700
8+1.549	6.664
8+2.293	6.082
8+2.321	6.000
8+2.379	6.100
8+2.388	6.364
8+2.403	5.909
8+2.441	6.691
8+2.451	6.027
8+2.465	6.527
8+2.475	5.891
8+2.542	6.482
8+2.552	6.109
8+2.556	5.982
8+2.556	6.700
8+2.561	6.064
8+2.667	6.109
8+2.671	6.536
8+3.314	6.073
8+3.319	6.164
8+3.319	6.264
8+3.405	6.491
8+3.492	6.718
8+3.496	6.009
8+3.506	6.173
8+3.511	6.500
8+3.564	5.982
8+3.573	6.118
8+3.827	6.245
8+3.894	6.245
8+3.923	6.391];
data.tL_f(:,1) = 365 * (data.tL_f(:,1)-0.3); % convert yr to d
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1);data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3;end;end
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'std length', 'females'};  
temp.tL_f = C2K(13);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Aoya2007';
%
data.tL_m = [ ... % time since birth (yr), std length (cm)
0.408	0.871
0.413	0.762
0.413	0.808
0.423	0.635
0.423	0.663
0.504	0.762
0.504	0.953
0.523	0.672
0.523	1.198
0.576	1.017
0.576	1.561
0.581	1.352
0.581	1.398
0.581	1.480
0.581	1.507
0.586	0.926
0.586	1.652
0.586	1.825
0.591	1.207
0.600	1.271
0.605	0.835
0.605	1.688
0.764	2.169
0.764	2.378
0.768	2.651
0.840	2.215
0.845	2.750
0.845	2.705
0.932	2.796
0.932	2.769
0.932	2.723
0.932	2.614
0.932	2.197
0.936	2.469
1.205	2.605
1.205	2.533
1.277	2.460
1.277	2.587
1.354	2.496
1.364	2.632
1.364	2.732
1.369	2.251
1.445	2.605
1.513	3.195
1.522	3.113
1.527	2.687
1.532	2.469
1.532	2.977
1.532	3.041
1.546	2.923
1.599	2.533
1.604	3.322
1.609	2.896
1.609	3.159
1.613	3.250
1.690	3.467
1.695	3.558
1.700	3.349
1.705	3.313
1.786	3.667
1.796	3.540
1.849	2.868
1.868	3.849
1.878	3.259
1.882	3.522
2.305	3.967
2.468	2.995
2.550	3.340
2.617	4.357
2.622	4.248
2.699	3.912
2.732	3.685
2.737	4.257
2.814	4.030
2.814	4.339
2.905	4.457
3.328	4.303
3.395	4.448
3.486	4.057
3.505	4.466
3.731	4.530
3.741	4.657
3.818	4.702
3.842	4.530
3.894	4.611
3.918	4.584
3.918	4.829
3.938	4.539
3.962	4.684
3.981	4.793
4+0.250	4.121
4+0.355	4.511
4+0.437	3.767
4+0.499	3.840
4+0.519	4.185
4+0.519	4.502
4+0.619	4.266
4+0.639	4.847
4+0.672	4.657
4+0.696	4.920
4+0.701	4.411
4+0.754	4.629
4+0.764	4.893
4+0.783	5.038
4+0.802	4.766
4+0.816	4.484
4+0.860	4.956
4+0.946	4.956
4+1.273	4.720
4+1.407	4.684
4+1.575	4.702
4+1.623	4.775
4+1.714	4.884
4+1.791	4.829
4+1.796	4.938
4+1.868	4.384
4+1.978	4.929
4+1.983	5.056
4+2.324	4.657
4+2.324	4.956
4+2.372	5.101
4+2.396	5.192
4+2.468	5.120
4+2.617	5.138
4+2.651	4.802
4+2.651	5.002
4+2.713	5.129
4+2.718	4.956
4+2.742	4.766
4+2.819	5.192
4+2.828	4.992
4+2.900	5.020
4+2.900	4.720
4+2.924	5.174
4+2.924	5.029
4+3.342	4.965
4+3.467	4.992
4+3.481	5.138
4+3.553	5.002
4+3.568	5.120
4+3.630	5.310
4+3.659	5.165
4+3.697	4.929
4+3.726	4.974
4+3.745	5.074
4+3.842	5.038
4+3.846	5.120
4+3.904	5.392
4+3.914	5.056
4+3.918	5.183
4+3.981	5.410
4+3.995	5.011
4+4.005	5.092];
data.tL_m(:,1) = 365 * (data.tL_m(:,1)-0.3); % convert yr to d
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1);data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3;end;end
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'std length', 'males'};  
temp.tL_m = C2K(13);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Aoya2007';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Wwb = 3 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.k_J = 0; weights.psd.k = 0.2; 

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'the data of this entry might refer to a new undecribed species of this genus';
D3 = 'temperature of tL data changes seasonally for 5 to 20 C';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Facts
F1 = 'length-weight: Ww (in g) = 0.00708*(TL in cm)^3.01';
metaData.bibkey.F1 = 'fishbase';
F2 = 'known from Kako River, Hyogo Prefecture, Japan';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6P7MW'; % Cat of Life
metaData.links.id_ITIS = '639742'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Lefua'; % Wikipedia
metaData.links.id_ADW = 'Lefua_echigonia'; % ADW
metaData.links.id_Taxo = '178262'; % Taxonomicon
metaData.links.id_WoRMS = '1018274'; % WoRMS
metaData.links.id_fishbase = 'Lefua-echigonia'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Lefua}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%73167
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Aoya2007'; type = 'Article'; bib = [ ...  
'doi = {10.1007/s10228-007-0406-2}, ' ...
'author = {Aoyama, S.}, ' ...
'year = {2007}, ' ...
'title = {Sexual size dimorphism, growth, and maturity of the fluvial eight-barbel loach in the Kako River, Japan}, ' ... 
'journal = {Ichthyological Research}, ' ...
'volume = {54(3)}, '...
'pages = {268–276}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Lefua-echigonia}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

