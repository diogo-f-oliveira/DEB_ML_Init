function [data, auxData, metaData, txtData, weights] = mydata_Eudyptes_chrysocome
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Sphenisciformes'; 
metaData.family     = 'Spheniscidae';
metaData.species    = 'Eudyptes_chrysocome'; 
metaData.species_en = 'Southern rockhopper penguin'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Tnsfm'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCvf', 'biCic', 'biCik'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.2); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'; 't-pT'; 't-JOe'}; 

metaData.COMPLETE = 3.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 10 22];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 09 30];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2022 12 05];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_3     = [2023 07 01];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 01];

%% set data
% zero-variate data

data.ab = 35;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Wiki';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 60;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Will1981';   
  temp.tx = C2K(38.2);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 180;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(38.2);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 5*365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'EoL';
  temp.tR = C2K(38.2);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
  comment.tR = 'value for Eudyptes_pachyrhynchus'; 
data.am = 20*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(38.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 70;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Will1981';
data.Wwi = 4e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'Will1981';
  comment.Wwi = 'asymptotic weight of nesting; adult 2 to 3.4 kg, max 4.5 kg (Wiki)';

data.Ri  = 2/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(38.2);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Like all Eudytes, 2 eggs per clutch, but only 1 survives';
 
% uni-variate data
% time-weight
data.tW = [ ... % age (d) weight (g)
0.296	98.947
10.493	454.287
20.099	758.286
24.828	915.795
30.443	977.837
35.025	1201.410
40.049	1443.305
45.369	1637.475
50.542	1743.580
54.828	1956.162
60.000	2051.259];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(38.2);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Will1981'; 

% time-weight-energy expenditure
data.tWpT = [ ... % 
 0	  51.245   29.919
 7	 163.955  102.765
14	 520.878  336.455
21	 715.113  582.022
28	1168.255  887.139
35	1199.703  716.073
42	1504.916  716.073
49	1662.266  754.940
56	1982.142  935.033
63	1784.398  894.865
70	1727.120  795.227];
units.tWpT   = {'d', 'g', 'kJ/d'};  label.tWpT = {'time since birth', 'wet weight', 'energy expenditure'};  
temp.tWpT    = C2K(38.2);  units.temp.tWpT = 'K'; label.temp.tWpT = 'temperature';
bibkey.tWpT = 'Brow1987'; treat.tWpT = {1, {'wet weight', 'energy expenditure'},};

% time-respiration
data.tJOe_A = [ ... % age (d), O2-consumption (ml/d)
 6.647	 9.719
 9.714	 6.479
10.864	 6.479
13.932	12.959
14.958	35.637
15.468	25.918
19.824	93.952
19.946	58.315
24.308	158.747
24.440	181.425
24.684	116.631
24.698	194.384
24.811	106.911
24.832	230.022
24.942	129.590
25.079	181.425
25.209	197.624
25.222	268.898
29.838	359.611
29.841	382.289
29.989	498.920
30.084	304.536
30.103	417.927
30.107	440.605
30.215	323.974
30.366	460.043
30.461	268.898
34.605	589.633
34.736	609.071
34.853	544.276
34.995	628.510
34.996	631.749
35.094	460.043
35.111	560.475
35.128	657.667
35.230	508.639
35.234	528.078
35.259	673.866
35.375	609.071
35.499	586.393
36.069	929.806
36.312	855.292
36.427	780.778
37.063	764.579
37.195	790.497
37.215	907.127
37.460	842.333
37.583	816.415
37.613	991.361
38.217	787.257
40.031	933.045
40.289	946.004
40.561	1043.197];
units.tJOe_A   = {'d', 'ml/d'};  label.tJOe_A = {'age birth', 'O_2 consumption', 'A-egg'};  
temp.tJOe_A    = C2K(36);  units.temp.tJOe_A = 'K'; label.temp.tJOe_A = 'temperature';
initMass.tJOe_A = '77.5'; units.initMass.tJOe_A = 'g'; label.initMass.tJOe_A = 'initial mass';
bibkey.tJOe_A = 'Brow1988';
comment.tJOe_A = 'egg temperature was 27.9 C during 107 d, then 34-35 C';
%
data.tJOe_B = [ ... % age (d), O2-consumption (ml/d)
 5.679	 10.124
10.325	 16.936
14.458	 39.801
14.462	 62.333
14.976	 49.499
14.982	84.907
19.643	172.192
19.653	233.352
19.768	152.889
20.034	194.756
20.674	165.837
24.994	526.700
24.997	542.794
25.005	594.297
25.100	394.734
25.103	410.829
25.259	565.348
25.377	500.980
30.176	649.434
30.178	659.091
30.183	688.062
30.184	691.281
30.193	746.002
30.194	749.221
30.478	903.751
30.487	955.253
30.722	823.298
34.645	1126.189
34.696	1419.111
34.751	1737.785
34.834	1470.625
35.710	1312.970
36.045	1763.641
36.310	1799.070];
units.tJOe_B   = {'d', 'ml/d'};  label.tJOe_B = {'age birth', 'O_2 consumption', 'B-egg'};  
temp.tJOe_B    = C2K(36);  units.temp.tJOe_B = 'K'; label.temp.tJOe_B = 'temperature';
initMass.tJOe_B = '111.9'; units.initMass.tJOe_B = 'g'; label.initMass.tJOe_B = 'initial mass';
bibkey.tJOe_B = 'Brow1988'; 
comment.tJOe_B = 'egg temperature was 27.9 C during 107 d, then 34-35 C';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.initMass = initMass;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tJOe_A','tJOe_B'}; subtitle1 = {'A- and B-egg'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'The std model cannot capture the large value for tp'; 
D3 = 'mod_1: tJOe and tWpT data added';
D4 = 'mod_2: v is reduced';
D5 = 'mod_3: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5);

%% Links
metaData.links.id_CoL = '3C39V'; % Cat of Life
metaData.links.id_ITIS = '559996'; % ITIS
metaData.links.id_EoL = '45512083'; % Ency of Life
metaData.links.id_Wiki = 'Eudyptes_chrysocome'; % Wikipedia
metaData.links.id_ADW = 'Eudyptes_chrysocome'; % ADW
metaData.links.id_Taxo = '51395'; % Taxonomicon
metaData.links.id_WoRMS = '212657'; % WoRMS
metaData.links.id_avibase = 'ECEE0622D6435B0C'; % avibase
metaData.links.id_birdlife = 'southern-rockhopper-penguin-eudyptes-chrysocome'; % birdlife
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Eudyptes_chrysocome}}';
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
bibkey = 'Will1981'; type = 'Article'; bib = [ ... 
'author = {A. J. Williams}, ' ... 
'year = {1981}, ' ...
'title = {Growth and survival of artificially twinned rockhopper peguin chicks}, ' ...
'journal = {Cormorant}, ' ...
'volume = {9}, ' ...
'pages = {8--12}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/1049612/overview}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Brow1987'; type = 'Article'; bib = [ ... 
'author = {Christopher R. Brown}, ' ... 
'year = {1987}, ' ...
'title = {Energy Requirements for Growth and Maintenance in Macaroni and Rockhopper Penguins}, ' ...
'journal = {Polar Biol.}, ' ...
'volume = {8}, ' ...
'pages = {95-102 }'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Brow1988'; type = 'Article'; bib = [ ... 
'author = {Christopher R. Brown}, ' ... 
'year = {1988}, ' ...
'title = {Egg temperature and embryonic metabolism of {A}- and {B}-eggs of macaroni and rockhopper penguins}, ' ...
'journal = {S.-Afr. Tydskr. Dierk.}, ' ...
'volume = {23(3)}, ' ...
'pages = {166-172 }'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PrinPres1991'; type = 'Article'; bib = [ ... 
'doi = {10.1016/0300-9629(91)90122-S}, ' ...
'author = {R. Prinzinger and A.Pre{\ss}mar and E. Schleucher}, ' ... 
'year = {1991}, ' ...
'title = {Body temperature in birds}, ' ...
'journal = {Comp. Biochem. Physiol.}, ' ...
'volume = {99A(4)}, ' ...
'pages = {499-506}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

