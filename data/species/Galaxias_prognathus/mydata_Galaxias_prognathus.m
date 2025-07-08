function [data, auxData, metaData, txtData, weights] = mydata_Galaxias_prognathus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Galaxiiformes'; 
metaData.family     = 'Galaxiidae';
metaData.species    = 'Galaxias_prognathus'; 
metaData.species_en = 'Longjawed galaxias'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'TAz'};
metaData.ecoCode.habitat = {'0iFc'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(8); % in K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'}; 
metaData.date_subm = [2017 03 26]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University, Amsterdam'};

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 02];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 02];

%% set data
% zero-variate data
data.am = 4.5*365;   units.am = 'd';    label.am = 'life span';                         bibkey.am = 'Bonn1990';  
  temp.am = C2K(19); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 6.5;   units.Lp = 'cm';   label.Lp = 'total length at puberty for females'; bibkey.Lp = 'guess';
data.Li = 8.7;     units.Li = 'cm';   label.Li = 'ultimate total length for females'; bibkey.Li = 'Bonn1992';
data.Lim = 7.7;    units.Lim = 'cm';  label.Lim = 'ultimate total length for males';  bibkey.Lim = 'Bonn1990';

data.Wwb = 3.1e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';              bibkey.Wwb = 'Bonn1992';
  comment.Wwb = 'based on egg diameter of 1.8 mm: 4/3*pi*0.09^3';

data.Ri = 280/365; units.Ri = '#/d';  label.Ri = 'max reprod rate'; bibkey.Ri = 'Bonn1992';
  temp.Ri = C2K(8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% uni-variate data
% tL data for females
data.tL_f = [ ... % age (years) ~ Length (cm) 
0.001	5.718
0.998	6.875
2.009	7.015
2.999	7.278];
data.tL_f(:,1) = 365 * (.75 + data.tL_f(:,1)); % convert yr to d
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(8);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Bonn1990';
comment.tL_f = 'data for females';
% tL data for males
data.tL_m = [ ... % age (years) ~ Length (cm) 
0.005	5.392
0.996	5.695
2.006	5.835
3.008	6.464];
data.tL_m(:,1) = 365 * (.75 + data.tL_m(:,1)); % convert yr to d
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(8);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Bonn1990';
comment.tL_m = 'data for males';

% length - weight
data.LW = [ ... % total length (cm), wet weight (g)
5.021	0.537
5.146	0.560
5.146	0.560
5.384	0.538
5.407	0.472
5.475	0.494
5.521	0.583
5.555	0.650
5.634	0.650
5.679	0.695
5.691	0.806
5.748	0.829
5.748	0.829
5.748	0.985
5.793	0.651
5.827	0.562
5.838	0.696
5.861	0.807
5.929	0.829
5.929	0.852
5.929	0.918
5.952	1.008
5.963	0.763
5.963	1.097
5.974	1.164
6.020	1.186
6.054	0.763
6.065	1.142
6.088	0.919
6.099	0.963
6.111	0.741
6.111	1.097
6.122	1.164
6.213	0.697
6.224	0.875
6.247	1.142
6.292	0.741
6.326	0.964
6.338	1.098
6.349	1.254
6.360	1.321
6.394	1.454
6.417	1.076
6.451	1.454
6.462	1.343
6.474	1.276
6.496	0.898
6.496	1.076
6.508	1.410
6.519	1.210
6.542	1.544
6.565	1.076
6.565	1.210
6.599	1.188
6.644	1.366
6.655	1.188
6.667	1.054
6.678	1.455
6.701	1.010
6.712	1.210
6.712	1.567
6.735	1.478
6.746	1.366
6.769	1.054
6.780	1.478
6.791	1.255
6.826	1.166
6.848	1.611
6.860	1.478
6.860	1.344
6.882	1.812
6.905	1.567
6.905	1.433
6.928	1.055
6.950	1.255
6.950	1.233
6.962	1.634
6.973	1.389
6.984	1.745
7.018	1.367
7.064	1.256
7.087	1.545
7.121	1.367
7.132	1.211
7.132	1.501
7.143	1.479
7.155	1.612
7.177	1.724
7.200	2.080
7.234	1.635
7.234	1.568
7.234	1.479
7.257	2.147
7.257	2.281
7.268	1.813
7.279	2.370
7.291	1.813
7.291	1.368
7.382	1.457
7.382	1.346
7.404	1.591
7.438	1.880
7.461	1.480
7.472	1.903
7.484	1.658
7.518	2.237
7.552	1.591
7.597	2.259
7.609	1.769
7.609	1.903
7.620	1.925
7.654	1.725
7.665	2.638
7.699	1.592
7.711	2.260
7.756	2.772
7.767	2.416
7.779	1.837
7.790	2.549
7.824	1.726
7.824	1.971
7.835	2.060
7.835	2.683
7.847	1.547
7.847	2.238
7.847	2.438
7.881	2.527
7.892	2.683
7.904	3.775
7.926	1.882
7.949	2.439
8.006	1.971
8.006	1.860
8.028	2.439
8.028	1.726
8.028	2.149
8.074	2.283
8.074	3.508
8.142	2.261
8.142	2.818
8.165	2.194
8.165	2.439
8.165	2.796
8.199	2.194
8.199	1.994
8.210	2.595
8.210	2.729
8.210	3.486
8.244	3.263
8.278	3.152
8.289	2.774
8.289	2.462
8.289	3.419
8.301	3.241
8.312	2.618
8.335	3.620
8.346	2.395
8.357	3.152
8.380	2.462
8.391	3.375
8.426	2.952
8.448	2.596
8.471	2.574
8.494	2.373
8.516	3.242
8.550	4.177
8.641	3.866
8.675	2.864
8.675	3.042
8.698	2.485
8.698	3.198
8.800	3.621
8.948	3.889
8.970	3.154
8.970	3.377
8.970	4.134
9.038	4.468
9.072	3.756
9.072	4.580
9.106	3.979
9.129	4.402
9.265	4.625
9.288	3.957
9.288	4.068
9.288	4.625
9.288	4.848
9.367	6.451
9.401	4.336
9.435	6.140
9.526	4.381
9.651	4.181
9.719	3.936
9.742	4.403
9.844	5.295
9.855	5.384
10.014	6.186
10.071	6.164
10.252	6.008
10.377	6.922
10.457	6.633
10.468	6.232
11.489	9.353]; 
units.LW = {'cm', 'g'}; label.LW = {'total length', 'wet weight'};  
bibkey.LW = 'BoyMorr2007';
comment.LW = 'data for G. maculatus, which has the same max length';

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
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'Temperature 5 till 16 C';
metaData.bibkey.F1 = 'weather'; 
F2 = 'Endemic in New Zealand, no marine stages; females larger than males';
metaData.bibkey.F2 = 'Bonn1990'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '3F2WY'; % Cat of Life
metaData.links.id_ITIS = '623464'; % ITIS
metaData.links.id_EoL = '224520'; % Ency of Life
metaData.links.id_Wiki = 'Galaxias_prognathus'; % Wikipedia
metaData.links.id_ADW = 'Galaxias_prognathus'; % ADW
metaData.links.id_Taxo = '174655'; % Taxonomicon
metaData.links.id_WoRMS = '1014831'; % WoRMS
metaData.links.id_fishbase = 'Galaxias-prognathus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Galaxias_prognathus}}';
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
bibkey = 'Bonn1990'; type = 'article'; bib = [ ...
'author = {M. L. Bonnett}, ' ... 
'year   = {1990}, ' ...
'title  = {Age and growth of alpine galaxias (\emph{Galaxias paucispondylus} {S}tokell) and longjawed galaxias (\emph{G. prognathus} {S}tokell) in the {R}angitata {R}iver, {N}ew {Z}ealand}, ' ...
'journal = {New Zealand Journal of Marine and Freshwater Research}, ' ...
'howpublished = {\url{www.science.canterbury.ac.nz/nzns/issues/vol19-1992/bonnett.pdf}}, ' ...
'page = {151--158}, ' ...
'volume = {24}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Bonn1992'; type = 'article'; bib = [ ...
'author = {M. L. Bonnett}, ' ... 
'year   = {1992}, ' ...
'title  = {Spawning in sympatric alpine galaxias (\emph{Galaxias paucispondylus} {S}tokell) and longjawed galaxias (\emph{G. prognathus} {S}tokell) in a {S}outh {I}sland, {N}ew {Z}ealand, high-country stream}, ' ...
'journal = {New Zealand Natural Sciences}, ' ...
'page = {}, ' ...
'volume = {19}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BoyMorr2007'; type = 'article'; bib = [ ...
'author = {C. C. Boy and E. Morriconi and J. Calvo}, ' ... 
'year   = {2007}, ' ...
'title  = {Reproduction in puyen, \emph{Galaxias maculatus} ({P}isces: {G}alaxiidae), in the southernmost extreme of distribution}, ' ...
'journal = {J. Appl. Ichthyol.}, ' ...
'page = {547-554}, ' ...
'volume = {23}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.de/Country/CountrySpeciesSummary.php?c_code=554&id=12249}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'weather'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.yr.no/place/New_Zealand/Other/Rangitata_River/statistics.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

