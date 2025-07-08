function [data, auxData, metaData, txtData, weights] = mydata_Unio_tigridis

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Unionoida'; 
metaData.family     = 'Unionidae';
metaData.species    = 'Unio_tigridis'; 
metaData.species_en = 'Freshwater mussel'; 

metaData.ecoCode.climate = {'Cfb','Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr','0iFp'};
metaData.ecoCode.embryo  = {'Fbb'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjTvf', 'jiPp'};
metaData.ecoCode.gender  = {'D','Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li';  'Wwi'; 'Ri'};
metaData.data_1     = {'t-L_fT'}; 

metaData.COMPLETE = 2.5; 

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 02 05];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator    = {'Starrlight Augustine'};                             
metaData.email_cur  = {'sta@akvaplan.niva.no'};                 
metaData.date_acc   = [2021 02 05];      

%% set data
% zero-variate data

data.am = 11*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'OstrGoph1993';   
  temp.am = C2K(18);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = .02;   units.Lb  = 'cm';  label.Lb  = 'shell length at birth';   bibkey.Lb  = 'unio';  
data.Lj  = .03;   units.Lj  = 'cm';  label.Lj  = 'shell length at settlement';   bibkey.Lj  = 'guess';  
data.Lp  = 2;   units.Lp  = 'cm';  label.Lp  = 'shell length at puberty'; bibkey.Lp  = 'guess';
  comment.Lp = 'based on Unio pictorum';
data.Li  = 6.9;   units.Li  = 'cm';  label.Li  = 'ultimate shell length';   bibkey.Li  = 'OstrGoph1993';

data.Ri = 12e3/365;  units.Ri = '#/d';    label.Ri = 'reproduction rate at SL 4 cm'; bibkey.Ri = 'ReisArau2016';   
  temp.Ri = C2K(18);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'Based on Unio tumidiformis';

% uni-variate data

% lemgth-change in length
data.LdL1 = [ ... % shel length (cm), shell depth after 1 yr (cm)
0.634	1.803
0.743	2.372
0.826	2.199
0.899	2.646
0.957	2.341
0.968	2.169
1.018	2.687
1.040	2.230
1.040	2.402
1.077	2.535
1.079	2.941
1.126	2.839
1.135	2.382
1.172	2.606
1.255	2.484
1.267	2.565
1.337	2.341
1.339	2.839
1.361	2.433
1.388	3.134
1.397	2.535
1.506	2.839
1.529	2.697
1.601	2.839
1.708	2.890
1.814	2.707
2.124	2.992
2.197	3.297
2.197	3.348
2.209	3.256
2.220	3.154
2.338	2.951
2.376	3.459
2.387	3.236
2.412	3.500
2.412	3.571
2.435	3.297
2.435	3.378
2.543	3.581
2.554	3.459
2.626	3.470
2.626	3.642
2.685	3.419
2.709	3.510
2.710	3.734
2.864	3.652
2.864	3.713
2.899	3.490
2.901	3.896
2.935	3.612
2.982	3.490
2.984	3.907
3.041	3.419
3.128	4.130
3.162	3.805
3.246	3.998
3.305	3.856
3.376	3.886
3.412	3.978
3.435	3.815
3.471	3.917
3.507	3.998
3.508	4.059
3.508	4.110
3.508	4.201
3.519	3.947
3.580	4.211
3.616	4.354
3.639	4.242
3.664	4.354
3.674	4.110
3.747	4.374
3.805	4.150
3.806	4.242
3.806	4.425
3.878	4.455
3.936	4.201
3.937	4.303
3.937	4.374
4.043	4.293
4.105	4.659
4.115	4.415
4.151	4.526
4.199	4.598
4.223	4.496
4.319	4.811
4.390	4.760
4.463	4.984
4.521	4.791];
units.LdL1 = {'cm', 'cm'}; label.LdL1 = {'shell length', 'shell length after 1 yr', 'Jordan inlet zone Lake Kinneret, Israel'};  
temp.LdL1 = C2K(18);  units.temp.LdL1 = 'K'; label.temp.LdL1 = 'temperature';
bibkey.LdL1 = 'OstrGoph1993';
comment.LdL1 = 'Data from Jordan inlet zone Lake Kinneret, Israel; mean temperature is guessed';
%
data.LdL2 = [ ... % time since birth (yr), shell depth (cm)
1.337	2.380
1.417	2.138
1.495	2.897
1.595	2.558
1.604	2.784
1.615	2.704
1.694	2.535
1.744	2.680
1.754	2.414
1.813	2.882
1.823	2.656
1.873	2.882
1.941	3.156
1.952	3.092
1.960	3.519
1.972	2.681
1.981	3.156
2.021	3.028
2.032	2.689
2.050	3.286
2.101	3.020
2.271	2.682
2.299	3.286
2.319	3.383
2.348	3.375
2.378	3.287
2.379	3.206
2.389	2.996
2.390	2.827
2.488	3.182
2.516	3.779
2.558	3.094
2.558	2.908
2.597	3.481
2.687	2.997
2.696	3.667
2.697	3.215
2.697	3.151
2.706	3.377
2.706	3.336
2.794	3.901
2.846	3.087
2.854	3.812
2.874	3.708
2.885	3.425
2.896	3.167
2.915	3.417
2.984	3.579
3.004	3.692
3.004	3.531
3.044	3.555
3.073	3.644
3.103	3.854
3.153	3.507
3.153	3.426
3.172	3.902
3.182	3.983
3.184	3.338
3.212	3.773
3.243	3.531
3.252	3.878
3.262	3.822
3.282	3.669
3.322	3.806
3.361	3.983
3.361	3.806
3.391	3.935
3.400	4.201
3.431	3.798
3.461	3.702
3.461	3.605
3.520	3.911
3.520	3.782
3.521	3.702
3.539	4.395
3.589	4.025
3.589	3.992
3.610	3.807
3.639	4.138
3.659	4.049
3.698	4.436
3.698	4.202
3.699	4.114
3.749	3.864
3.768	3.977
3.788	4.243
3.807	4.332
3.808	4.187
3.808	4.033
3.867	4.187
3.877	4.300
3.917	4.090
3.966	4.389
4.007	4.090
4.016	4.486
4.016	4.373
4.026	4.324
4.036	4.244
4.095	4.405
4.175	4.518
4.175	4.438
4.184	4.793
4.185	4.373
4.194	4.575
4.204	4.615
4.284	4.640
4.284	4.575
4.343	4.591
4.353	4.745
4.403	4.705
4.433	4.713
4.443	4.551
4.472	4.777
4.511	5.027
4.571	4.939
4.571	4.858
4.572	4.753
4.621	4.858
4.710	5.077
4.710	4.899
4.750	4.980
4.810	5.020
4.949	5.093
5.018	5.102];
units.LdL2 = {'cm', 'cm'}; label.LdL2 = {'shell length', 'shell length after 1 yr', 'Poria zone Lake Kinneret, Israel'};  
temp.LdL2 = C2K(18);  units.temp.LdL2 = 'K'; label.temp.LdL2 = 'temperature';
bibkey.LdL2 = 'OstrGoph1993';
comment.LdL2 = 'Data from Poria zone Lake Kinneret, Israel; mean temperature is guessed';

% length-weight
data.LWw = [ ... log10 length (cm), log10 tissue wet weight (g)
0.255	-0.796
0.396	-0.354
0.402	-0.388
0.474	-0.202
0.475	-0.243
0.478	-0.138
0.502	-0.126
0.508	-0.010
0.508	0.100
0.521	0.037
0.533	0.037
0.580	0.252
0.599	0.345
0.606	0.287
0.623	0.276
0.634	0.357
0.653	0.491
0.665	0.450
0.679	0.642
0.682	0.445
0.685	0.514
0.689	0.602
0.703	0.474
0.706	0.526
0.725	0.555
0.730	0.579
0.739	0.643
0.746	0.695
0.755	0.753
0.761	0.718
0.838	1.050];
data.LWw = 10.^data.LWw; % remove log transform
units.LWw = {'cm', 'g'}; label.LWw = {'shell length', 'tissue wet weight'};  
bibkey.LWw = 'OstrGoph1993';

%% set weights for all real data
weights = setweights(data, []);
weights.LdL1 = 20 * weights.LdL1;
weights.LdL2 = 20 * weights.LdL2;
weights.Li = 3 * weights.Li;
weights.Lj = 0 * weights.Lj;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.3; weights.psd.k = 1; units.psd.k = '-'; label.psd.k = 'maintenance ratio';
%weights.psd.p_M = 0;
%weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LdL1','LdL2'}; subtitle1 = {'Data from Jordan inlet, Poria zone, Lake Kinneret, Israel'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Species Unio terminalis is unknown in MolluscaBase, the likely species is Unio tigridis, based on ArauBuck2017';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '7DKGV'; % Cat of Life
metaData.links.id_ITIS = '984743'; % ITIS
metaData.links.id_EoL = '35216482'; % Ency of Life
metaData.links.id_Wiki = 'Unio_(bivalve)'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '3405777'; % Taxonomicon
metaData.links.id_WoRMS = '571970'; % WoRMS
metaData.links.id_molluscabase = '571970'; % molluscabase

%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'OstrGoph1993'; type = 'Article'; bib = [ ...
'author = {I. Ostrovsky and M. Gophen and I. Kalikhman}, ' ... 
'year = {1993}, ' ...
'title = {Distribution, growth, production, and ecological significance of the clam \emph{Unio terminalis} in {L}ake {K}inneret, {I}srael}, ' ...
'journal = {Hydrobiologia}, ' ...
'volume = {271}, ' ...
'pages = {49-63}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ArauBuck2017'; type = 'Article'; bib = [ ...
'author = {Rafael Araujo and David Buckley and Karl-Otto Nagel and Ricardo Garc\''{i}a-Jim\''{e}nez and Aannie Machordom}, ' ... 
'year = {2017}, ' ...
'title = {Species boundaries, geographic distribution and evolutionary history of the {W}estern {P}alaearctic freshwater mussels \emph{Unio} ({B}ivalvia: {U}nionidae)}, ' ...
'journal = {Zoological Journal of the Linnean Society}, ' ...
'volume = {20}, ' ...
'pages = {1-25}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'unio'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.unio.lu/freshwater-mussel/biology/reproduction-cycle/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ReisArau2016'; type = 'Article'; bib = [ ...
'doi = {10.1111/ivb.12114}, ' ...
'author = {Joaquim Reis and and Rafael Araujo}, ' ... 
'year = {2016}, ' ...
'title = {Life history of the freshwater mussel \emph{Unio tumidiformis} ({B}ivalvia: {U}nionidae) in a temporary {M}editerranean-type stream}, ' ...
'journal = {Invertebrate Biology}, ' ...
'volume = {135(1)}, ' ...
'pages = {31-45}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

