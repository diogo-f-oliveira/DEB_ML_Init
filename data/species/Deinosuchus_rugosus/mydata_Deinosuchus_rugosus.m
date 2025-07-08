function [data, auxData, metaData, txtData, weights] = mydata_Deinosuchus_rugosus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Crocodilia'; 
metaData.family     = 'Alligatoridae';
metaData.species    = 'Deinosuchus_rugosus'; 
metaData.species_en = 'Deinosuchus'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0bTd', 'biFm', 'biFr'};
metaData.ecoCode.embryo  = {'Tl'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCvr', 'biCvf'};
metaData.ecoCode.gender  = {'Dtfm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 1.0; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2016 10 22];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2017 11 20];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};  

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 11 20]; 

%% set data
% zero-variate data

data.tp = 30*365;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(28);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'Very speculative';
data.am = 51*365;    units.am = 'd';    label.am = 'life span';                   bibkey.am = 'EricBroc1999';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li = 880; units.Li = 'cm';   label.Li = 'ultimate total length';             bibkey.Li = 'EricBroc1999';

data.Wwi = 5e6; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';             bibkey.Wwi = 'EricBroc1999';

data.Ri  = 200/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'guess';   
  temp.Ri = C2K(28);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Very speculative, including temperature, based on cumulated neonate mass equals ultimate weight';
 
% uni-variate data
% time-length
data.tL_MT = [ ... % time since birth (yr), total length (cm)
0.000	19.275
0.792	30.530
1.983	48.212
2.855	70.697
3.965	99.606
5.075	126.912
6.027	149.399
6.979	171.887
7.851	197.581
9.041	223.284
9.991	258.606
10.942	295.532
11.972	334.065
12.924	356.552
13.954	383.855
14.986	403.136
16.017	425.626
16.969	449.718
17.921	464.185
18.873	481.859
19.985	494.726
20.858	507.586
21.970	523.661
22.922	538.127
23.954	552.596
24.906	571.875
26.017	591.159
27.049	610.440
27.842	628.110
28.953	648.998
29.984	669.884
30.854	719.642
31.886	734.111
32.919	738.954
33.952	742.192
34.984	755.057
35.937	766.314
36.889	775.968
37.922	782.415
38.875	790.464
39.828	796.909
41.020	800.153
41.894	804.991
43.006	809.836
43.960	816.281
44.992	822.728
45.946	825.965
46.819	832.407
47.852	835.646
48.806	838.882
49.998	843.730
50.951	850.175];
data.tL_MT(:,1) = 365 * data.tL_MT(:,1);
units.tL_MT   = {'d', 'cm'};  label.tL_MT = {'time since birth', 'total length'};  
temp.tL_MT    = C2K(28);  units.temp.tL_MT = 'K'; label.temp.tL_MT = 'temperature';
bibkey.tL_MT = 'EricBroc1999';
comment.tL_MT = 'MT-population. Temperature is speculative; weights reconstructured from bone lengths';
%
data.tL_TX = [ ... % time since birth (yr), total length (cm)
0.157	22.490
0.791	36.947
1.822	69.063
3.011	107.600
3.961	147.735
4.831	191.076
5.940	234.423
6.970	276.165
7.841	306.671
8.792	335.576
9.903	364.486
10.933	391.788
11.964	423.904
12.836	449.598
13.787	480.107
14.978	492.976
15.930	509.046
16.883	525.117
17.835	537.979
18.867	552.448
19.978	571.731
21.090	584.598
21.884	591.038
22.758	597.481
23.871	597.513
25.141	607.176
26.015	612.014
26.810	610.433
27.762	626.504
28.715	640.970
29.906	649.026
30.859	661.888
31.891	671.544
32.765	684.404
33.797	694.059
34.908	708.530
36.020	719.793
36.973	731.051
37.846	742.306
39.037	755.175
39.831	764.824
40.784	774.477
41.737	785.735
42.690	796.993
43.642	808.250
44.754	821.117
45.946	825.965
46.899	830.805];
data.tL_TX(:,1) = 365 * data.tL_TX(:,1);
units.tL_TX   = {'d', 'cm'};  label.tL_TX = {'time since birth', 'total length'};  
temp.tL_TX    = C2K(28);  units.temp.tL_TX = 'K'; label.temp.tL_TX = 'temperature';
bibkey.tL_TX = 'EricBroc1999';
comment.tL_TX = 'TX-population. Temperature is speculative; weights reconstructured from bone lengths';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_MT','tL_TX'}; subtitle1 = {'Data for MT, TX populations'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Several data are very speculative, such as T, Ri';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Extinct, lived 80 till 73 Ma ago';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = ''; % Cat of Life not present 2021/08/07
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '4472734'; % Ency of Life
metaData.links.id_Wiki = 'Deinosuchus_rugosus'; % Wikipedia
metaData.links.id_Taxo = '50639'; % Taxonomicon
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Deinosuchus}}';
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
bibkey = 'EricBroc1999'; type = 'Article'; bib = [ ... 
'author = {G. M. Erickson and C. A. Brochu}, ' ... 
'year = {1999}, ' ...
'title = {How the terror crocodile grew so big}, ' ...
'journal = {Nature}, ' ...
'volume = {398}, ' ...
'pages = {205--206}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

