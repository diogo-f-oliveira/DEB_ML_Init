function [data, auxData, metaData, txtData, weights] = mydata_Circus_aeruginosus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Accipitriformes'; 
metaData.family     = 'Accipitridae';
metaData.species    = 'Circus_aeruginosus'; 
metaData.species_en = 'Western marsh harrier';

metaData.ecoCode.climate = {'Cfb', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFm', '0iTh'};
metaData.ecoCode.embryo  = {'Tnsf'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCvb', 'biCvm', 'biCva', 'biCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'; 't-pX'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2016 11 25];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 11 17];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2023 04 10];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_3     = [2023 07 03];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 03];

%% set data
% zero-variate data

data.ab = 35.5;      units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'Wiki';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'Varyies between 35 and 40 d';
data.tx = 36;       units.tx = 'd';     label.tx = 'time since birth at fledging';  bibkey.tx = 'KrijDijk1998';   
  temp.tx = C2K(40); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 108;       units.tp = 'd';     label.tp = 'time since birth at puberty';  bibkey.tp = 'guess';   
  temp.tp = C2K(40); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 730;     units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'AnAge';
  temp.tR = C2K(40); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 20.1*365;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'AnAge';   
  temp.am = C2K(40); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 24.3;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'KrijDijk1998';
data.Wwi = 743;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'KrijDijk1998';
data.Wwim = 522;  units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for male';  bibkey.Wwim = 'KrijDijk1998';
  
data.Ri  = 5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(40); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 clutch per yr, 3-8 eggs/clutch';
  
% uni-variate data
% time-weight
data.tW_f = [ ... % time since birth (d), wet weight (g)
0.064	24.377
2.114	38.264
4.032	60.280
5.882	95.067
7.995	140.296
10.042	189.009
12.022	250.493
14.001	325.907
15.913	399.001
17.957	476.735
20.003	540.540
21.983	599.702
23.899	636.809
26.014	664.625
28.064	687.799
29.983	685.437
32.033	710.933
33.885	717.859
39.975	706.121
50.964	684.994];
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(40);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f  = 'KrijDijk1998';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time since birth (d), wet weight (g)
0.064	24.377
1.917	30.142
4.033	50.993
5.949	78.813
8.063	124.042
10.110	172.755
12.024	231.919
14.004	293.403
16.050	346.759
18.030	407.082
20.012	451.153
22.060	490.579
24.043	517.237
26.092	539.250
27.944	550.820
29.930	550.778
32.047	564.664
33.965	570.427
39.991	544.761
51.046	515.506];
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(40);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m  = 'KrijDijk1998';
comment.tW_m = 'Data for males';

% time-food intake
data.tpX_f = [ ... % time since birth (d), food intake (kJ/d)
0.005	66.258
1.807	107.976
3.888	191.411
5.877	294.479
7.777	377.914
9.945	505.521
12.018	701.840
14.002	871.166
16.083	944.785
17.892	1030.675
19.972	1136.196
21.964	1190.184
23.876	1111.656
25.868	1177.914
27.965	1055.215
29.959	1087.117
31.952	1128.834
33.963	949.693
39.962	824.540
51.212	878.528];
units.tpX_f   = {'d', 'kJ/d'};  label.tpX_f = {'time since birth', 'food intake', 'female'};  
temp.tpX_f    = C2K(40);  units.temp.tpX_f = 'K'; label.temp.tpX_f = 'temperature';
bibkey.tpX_f  = 'KrijDijk1998';
comment.tpX_f = 'Data for females';
% 
data.tpX_m = [ ... % time since birth (d), food intake (kJ/d)
0.086	58.896
1.899	90.798
3.981	166.871
5.880	252.761
8.049	373.006
9.946	490.798
12.023	625.767
13.925	677.301
16.002	826.994
17.994	878.528
19.991	878.528
21.983	942.331
24.068	974.233
25.978	927.607
27.889	856.442
30.067	851.534
31.976	812.270
34.156	797.546
40.065	667.485
51.127	809.816];
units.tpX_m   = {'d', 'kJ/d'};  label.tpX_m = {'time since birth', 'food intake', 'male'};  
temp.tpX_m    = C2K(40);  units.temp.tpX_m = 'K'; label.temp.tpX_m = 'temperature';
bibkey.tpX_m  = 'KrijDijk1998';
comment.tpX_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_f = weights.tW_f * 2; 
weights.tW_m = weights.tW_m * 2; 

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
set2 = {'tpX_f','tpX_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'food intake varies somewhat in time';
D3 = 'mod_1: v is reduced';
D4 = 'mod_2: males have equal state variables at b, compared to females';
D5 = 'mod_3: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5);  

%% Links
metaData.links.id_CoL = '5Z6WQ'; % Cat of Life
metaData.links.id_ITIS = '559297'; % ITIS
metaData.links.id_EoL = '45511397'; % Ency of Life
metaData.links.id_Wiki = 'Circus_aeruginosus'; % Wikipedia
metaData.links.id_ADW = 'Circus_aeruginosus'; % ADW
metaData.links.id_Taxo = '52508'; % Taxonomicon
metaData.links.id_WoRMS = '558541'; % WoRMS
metaData.links.id_avibase = 'E2A19474E62F83E1'; % avibase
metaData.links.id_birdlife = 'western-marsh-harrier-circus-aeruginosus'; % birdlife
metaData.links.id_AnAge = 'Circus_aeruginosus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Circus_aeruginosus}}';
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
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Circus_aeruginosus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KrijDijk1998'; type = 'Article'; bib = [ ...  
'title = {Energy Requirements for Growth in Relation to Sexual Size Dimorphism in Marsh Harrier \emph{Circus aeruginosus} Nestlings}, ' ...
'author = {K. L. Krijgsveld and C. Dijkstra and G. H. Visser and S. Daan}, ' ...
'journal = {Physiological Zoology}, ' ...
'year = {1998}, ' ...
'volume = {71}, ' ...
'pages = {693--702}'];
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

