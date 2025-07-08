function [data, auxData, metaData, txtData, weights] = mydata_Falco_berigora
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Falconiformes'; 
metaData.family     = 'Falconidae';
metaData.species    = 'Falco_berigora'; 
metaData.species_en = 'Brown kestrel'; 

metaData.ecoCode.climate = {'A','BWh', 'BSh', 'Cfa', 'Cfb'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTh', '0iTg', '0iTa'};
metaData.ecoCode.embryo  = {'Tnwf'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biCi', 'biCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 08 14];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1  = {'Bas Kooijman'};    
metaData.date_mod_1    = [2022 11 22];              
metaData.email_mod_1   = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1 = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2023 04 10];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_3     = [2023 07 05];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 05];

%% set data
% zero-variate data

data.ab = 30;  units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'avibase';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 31;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'avibase';   
  temp.tx = C2K(40);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 93;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'AnAge';
  temp.tR = C2K(40);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 24*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'avibase';   
  temp.am = C2K(40);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 45;  units.Ww0 = 'g';   label.Ww0 = 'initial wet weight';     bibkey.Ww0 = 'avibase';
data.Wwb = 31; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'McDo2003';
data.Wwi = 681.4; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight for female';     bibkey.Wwi = 'avibase';
data.Wwim = 506; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for male';    bibkey.Wwim = 'avibase';

data.Ri  = 2.8/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(40); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4.6 eggs per clutch;1-2 clutches/yr';
 
% uni-variate data
% time-weight
data.tW_f = [ ... % time since birth (d), wet weight (g)
0.000	26.598
0.097	42.314
0.920	67.703
0.921	60.449
0.970	48.359
1.939	36.269
2.861	93.092
2.909	78.584
3.006	35.060
3.927	48.359
3.976	103.972
4.848	123.316
4.945	95.509
4.946	145.078
5.964	106.390
7.127	85.838
8.727	162.003
8.920	142.660
8.921	128.152
9.939	197.064
10.085	251.468
10.958	158.377
11.830	235.751
11.975	302.245
11.976	317.962
12.945	216.408
13.963	317.962
13.964	182.556
14.011	373.575
14.012	238.169
15.903	331.261
16.000	369.948
16.001	355.440
16.873	452.159
17.017	397.755
17.018	356.649
18.036	426.770
19.006	402.591
19.975	469.085
19.976	460.622
20.945	501.727
20.993	472.712
20.994	465.458
21.914	486.010
21.915	385.665
22.012	513.817
22.885	472.712
23.855	577.893
23.903	557.340
25.988	507.772
27.927	523.489
27.928	494.473
27.976	593.610
28.897	574.266
28.898	544.041
28.945	603.282
29.867	626.252
31.030	552.504
32.048	562.176
34.958	618.998
36.024	637.133];
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight','female'};  
temp.tW_f    = C2K(40);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f  = 'McDo2003';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time since birth (d), wet weight (g)
0.000	31.433
1.017	45.941
1.018	35.060
1.937	56.822
1.938	50.777
1.939	39.896
1.940	35.060
2.909	39.896
2.958	71.330
3.055	58.031
3.056	49.568
3.878	78.584
3.879	95.509
3.927	60.449
4.944	76.166
4.945	54.404
4.994	96.718
6.012	124.525
6.109	83.420
6.158	91.883
6.885	44.732
8.000	139.033
8.001	134.197
8.921	91.883
10.035	184.974
10.036	154.750
10.908	216.408
10.909	140.242
10.958	165.630
11.006	124.525
11.927	239.378
11.976	263.558
12.023	250.259
12.024	162.003
12.848	288.946
12.945	270.812
12.994	172.884
13.867	301.036
14.012	272.021
14.061	245.423
15.079	313.126
15.127	176.511
16.000	297.409
16.047	366.321
16.048	279.275
17.018	243.005
17.212	294.991
18.035	385.665
18.036	365.112
18.037	263.558
18.958	363.903
19.976	412.263
20.944	394.128
20.945	305.872
20.994	330.052
21.041	412.263
21.042	401.382
21.043	368.739
21.964	444.905
22.011	371.157
22.012	361.485
22.982	424.352
24.047	434.024
24.048	400.173
24.049	385.665
24.970	472.712
25.987	438.860
25.988	434.024
25.989	427.979
26.958	569.430
28.944	453.368
28.945	461.831
29.091	438.860
30.012	449.741
30.061	455.786
31.030	515.026
31.951	492.055
31.952	443.696
32.000	456.995
32.970	423.143
33.018	499.309];
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight','male'};  
temp.tW_m    = C2K(40);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m  = 'McDo2003';
comment.tW_m = 'Data for males';

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
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Scaled functional response varies in time in tW data';
D3 = 'mod_1: v is reduced';
D4 = 'mod_2: males have equal state variables at b, compared to females';
D5 = 'mod_3: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5);

%% Links
metaData.links.id_CoL = '3DTFR'; % Cat of Life
metaData.links.id_ITIS = '175630'; % ITIS
metaData.links.id_EoL = '1049181'; % Ency of Life
metaData.links.id_Wiki = 'Falco_berigora'; % Wikipedia
metaData.links.id_ADW = 'Falco_berigora'; % ADW
metaData.links.id_Taxo = '52809'; % Taxonomicon
metaData.links.id_WoRMS = '1507474'; % WoRMS
metaData.links.id_avibase = '9F5AA09D9FE2C13C'; % avibase
metaData.links.id_birdlife = 'brown-falcon-falco-berigora'; % birdlife
metaData.links.id_AnAge = 'Falco_berigora'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Falco_berigora}}';
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
bibkey = 'McDo2003'; type = 'Article'; bib = [ ... 
'author = {Paul G. McDonald}, ' ... 
'year = {2003}, ' ...
'title = {Nestling growth and development of the brown falcon, \emph{Falco berigora}: am improved ageing formula and field-based method of sex determination}, ' ...
'journal = {Wildlife Research}, ' ...
'volume = {30}, ' ...
'pages = {411-418}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Falco_berigora}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=9F5AA09D9FE2C13C&sec=lifehistory}}';
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

