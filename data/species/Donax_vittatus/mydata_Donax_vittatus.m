function [data, auxData, metaData, txtData, weights] = mydata_Donax_vittatus

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Cardiida'; 
metaData.family     = 'Donacidae';
metaData.species    = 'Donax_vittatus'; 
metaData.species_en = 'Banded wedge shell'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAE', 'MAm'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb', 'jiMi'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPp', 'jiD'};
metaData.ecoCode.gender  = {'D','Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab';  'am';  'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'R_i'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2021 01 12];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 01 12]; 


%% set data
% zero-variate data

data.ab = 3;    units.ab = 'd';    label.ab = 'age at birth';                  bibkey.ab = 'guess';   
  temp.ab = C2K(15);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 8*365; units.am = 'd';    label.am = 'life span';                     bibkey.am = 'EoL';   
  temp.am = C2K(15);   units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 1.2;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';      bibkey.Lp  = 'guess';
data.Li  = 3.3; units.Li  = 'cm';  label.Li  = 'ultimate total length';        bibkey.Li  = 'Wiki';

data.Wwb = 4e-6;    units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 200 mum: pi/6*0.02^3';

data.Ri = 1e5/365; units.Ri  = '#/d';   label.Ri  = 'max reprod rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.95';
 
% uni-variate data
% t-L data
data.tL = [ ... % winter after settlement (yr), shell length (cm)
1	0.448
2	2.436
3	3.166
4	3.419];
data.tL(:,1) = (-.9 + data.tL(:,1)) * 365; % convert yr class to time since birth (d)
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell length', 'St. Trojan'};  
temp.tL    = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'AnseLaga1980';
comment.tL = 'Data from St. Trojan';
%
data.tL1 = [ ... % winter after settlement (yr), shell length (cm)
1.018	0.188
1.972	1.402
2.982	2.292
3.954	2.819
4.963	3.101
6.009	3.289];
data.tL1(:,1) = (-.9 + data.tL1(:,1)) * 365; % convert yr class to time since birth (d)
units.tL1   = {'d', 'cm'};  label.tL1 = {'time since birth', 'shell length', 'Firth of Forth'};  
temp.tL1    = C2K(10);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL1 = 'AnseLaga1980';
comment.tL1 = 'Data from Firth of Forth, GuUane Ansell, unpublished data';
%
data.tL2 = [ ... % winter after settlement (yr), shell length (cm)
0.982	0.361
2.009	1.222
3.000	1.923
4.028	2.299
5.018	2.508
5.954	2.617
7.018	2.667];
data.tL2(:,1) = (-.8 + data.tL2(:,1)) * 365; % convert yr class to time since birth (d)
units.tL2   = {'d', 'cm'};  label.tL2 = {'time since birth', 'shell length', 'Clyde'};  
temp.tL2    = C2K(9);  units.temp.tL2 = 'K'; label.temp.tL2 = 'temperature';
bibkey.tL2 = 'AnseLaga1980';
comment.tL2 = 'Data from Clyde, Barassie; (AnseU, unpublished data';

% length - weight
data.LW = [ ... % shell length (cm), wet weight (g)
1.681	0.459
1.808	0.542
1.841	0.614
1.883	0.698
1.892	0.602
1.916	0.710
1.948	0.794
2.005	0.974
2.023	0.661
2.047	0.998
2.047	1.130
2.070	0.829
2.080	0.865
2.084	0.925
2.094	1.130
2.122	0.961
2.131	0.805
2.169	0.985
2.169	0.865
2.187	0.829
2.197	1.406
2.197	1.177
2.197	1.057
2.201	1.273
2.206	0.973
2.225	1.153
2.244	1.237
2.244	0.960
2.248	1.285
2.253	0.792
2.253	1.093
2.262	1.225
2.267	0.852
2.272	1.381
2.276	1.453
2.276	1.153
2.276	1.309
2.295	1.128
2.300	1.345
2.304	1.201
2.304	0.960
2.309	1.345
2.314	1.068
2.328	1.273
2.328	0.816
2.333	1.273
2.337	1.958
2.347	1.128
2.351	1.441
2.356	1.092
2.361	1.296
2.361	1.116
2.365	1.296
2.375	1.284
2.379	1.332
2.384	1.549
2.389	1.849
2.393	1.549
2.393	1.296
2.403	1.104
2.417	1.092
2.422	1.500
2.422	1.368
2.426	1.621
2.431	1.140
2.445	1.308
2.450	1.428
2.459	1.188
2.464	1.632
2.464	1.440
2.464	1.200
2.473	1.188
2.482	1.945
2.492	1.368
2.496	1.620
2.496	1.199
2.525	1.873
2.525	1.512
2.529	1.416
2.534	1.848
2.534	1.584
2.534	1.428
2.534	1.235
2.539	1.355
2.548	1.271
2.553	1.572
2.557	1.836
2.562	1.644
2.576	1.788
2.581	1.788
2.585	1.343
2.590	1.584
2.595	1.451
2.600	1.680
2.600	1.776
2.609	1.848
2.609	1.968
2.618	1.547
2.623	1.355
2.628	1.812
2.628	1.607
2.628	1.668
2.632	1.932
2.637	1.860
2.665	1.992
2.665	1.739
2.679	1.691
2.679	1.619
2.689	1.787
2.698	1.956
2.698	1.415
2.707	1.896
2.707	1.811
2.721	1.595
2.740	2.040
2.745	2.220
2.745	1.787
2.745	1.715
2.749	1.931
2.754	1.847
2.759	2.148
2.759	1.943
2.773	1.823
2.773	1.150
2.778	2.112
2.787	1.895
2.792	2.460
2.796	1.931
2.806	2.484
2.806	2.220
2.806	1.847
2.810	2.220
2.810	2.328
2.810	1.065
2.815	2.171
2.829	2.472
2.834	2.159
2.834	2.027
2.838	2.051
2.843	2.099
2.848	1.871
2.852	2.315
2.857	2.472
2.862	1.895
2.867	2.688
2.867	2.051
2.867	1.991
2.867	1.931
2.876	2.183
2.876	2.123
2.885	2.484
2.890	2.315
2.890	2.099
2.895	2.544
2.904	2.303
2.923	3.061
2.927	2.568
2.927	1.990
2.937	2.423
2.937	2.303
2.941	2.135
2.956	2.423
2.956	2.279
2.956	2.086
2.974	2.603
2.974	2.736
2.984	2.291
2.984	2.375
2.984	2.170
3.002	2.952
3.002	2.483
3.002	2.603
3.012	2.435
3.021	2.747
3.021	2.266
3.021	2.086
3.026	2.170
3.030	2.904
3.049	3.000
3.049	2.699
3.049	2.627
3.054	2.543
3.063	2.615
3.073	3.084
3.073	2.350
3.073	2.278
3.073	2.218
3.077	2.903
3.087	2.999
3.087	2.867
3.096	2.927
3.096	2.494
3.101	2.663
3.110	2.566
3.119	2.614
3.124	3.035
3.124	2.626
3.129	3.143
3.133	2.446
3.138	2.963
3.143	2.759
3.162	3.035
3.162	2.578
3.171	2.807
3.185	2.939
3.185	3.047
3.204	3.468
3.222	3.203
3.227	3.456
3.237	3.419
3.237	2.758
3.251	3.023
3.251	2.926
3.265	3.768
3.269	3.576
3.283	3.684
3.288	3.058
3.293	3.191
3.297	3.768
3.311	3.659
3.311	3.034
3.316	3.455
3.321	2.974
3.326	3.142
3.330	3.659
3.330	3.299
3.335	3.767
3.335	2.902
3.344	3.491
3.349	3.623
3.354	3.118
3.358	3.996
3.358	3.900
3.363	3.707
3.368	3.407
3.382	3.827
3.382	3.467
3.391	3.635
3.396	3.094
3.400	3.575
3.405	4.044
3.415	3.635
3.429	3.971
3.433	3.815
3.447	4.140
3.447	3.550
3.452	3.911
3.452	3.610
3.457	3.791
3.485	3.670
3.494	4.332
3.513	4.211
3.532	3.766
3.536	4.764
3.578	4.067
3.588	4.391
3.597	4.451
3.597	3.802
3.616	4.415
3.644	4.619
3.644	4.138
3.653	4.511];
units.LW   = {'cm', 'g'};  label.LW = {'shell length', 'wet weight'};  
bibkey.LW = 'MaiaPime2007';
comment.LW = 'Weights probably include shell and environmental water';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL','tL1','tL2'}; subtitle1 = {'Data from St. Trojan, Firth of Forth, Clyde'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'mostly gonochoric, some are protandric hermaphrodites';
metaData.bibkey.F1 = 'sealifebase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6DDV4'; % Cat of Life
metaData.links.id_ITIS = '81251'; % ITIS
metaData.links.id_EoL = '46474540'; % Ency of Life
metaData.links.id_Wiki = 'Donax_vittatus'; % Wikipedia
metaData.links.id_ADW = 'Donax_vittatus'; % ADW
metaData.links.id_Taxo = '39570'; % Taxonomicon
metaData.links.id_WoRMS = '139604'; % WoRMS
metaData.links.id_molluscabase = '139604'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Donax_vittatus}}';
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
bibkey = 'MaiaPime2007'; type = 'techreport'; bib = [ ... 
'doi = {10.13140/RG.2.2.14716.69769}, ' ...
'author = {Francisco Maia and Joana Pimenta and Catarina Gon\c{c}alves}, ' ... 
'year = {2007}, ' ...
'title = {Growth of \emph{Donax vittatus} in the north-west coast of {P}ortugal; {B}iological data for the management of a new fishery}, ' ...
'institution = {IPIMAR}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnseLaga1980'; type = 'Article'; bib = [ ... 
'author = {A. D. Ansell 1 and F. Lagard\`{e}re }, ' ... 
'year = {1980}, ' ...
'title = {Observations on the Biology of \emph{Donax trunculus} and \emph{D. vittatus} at {I}le d''{O}l\''{e}ron ({F}rench {A}tlantic {C}oast)}, ' ...
'journal = {Mar. Biol.}, ' ...
'volume = {57}, ' ...
'pages = {287-300}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Donax-vittatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/46474540/data}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


