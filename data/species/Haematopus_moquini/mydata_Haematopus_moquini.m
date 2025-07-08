function [data, auxData, metaData, txtData, weights] = mydata_Haematopus_moquini
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Charadriiformes'; 
metaData.family     = 'Haematopodidae';
metaData.species    = 'Haematopus_moquini'; 
metaData.species_en = 'African black oystercatcher'; 

metaData.ecoCode.climate = {'BWk', 'BSh', 'BSk'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0xTs', 'xiFm', 'xiFe'};
metaData.ecoCode.embryo  = {'Tnsfm'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biCim'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.9); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 01 18];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 11 28];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 06 28];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 28];

%% set data
% zero-variate data

data.ab = 33;      units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'Wiki';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '27 till 39 d';
data.tx = 38;      units.tx = 'd';     label.tx = 'time since birth at fledging'; bibkey.tx = 'Wiki';   
  temp.tx = C2K(40.9); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 114;      units.tp = 'd';     label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.9); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 1825;     units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'AnAge';
  temp.tR = C2K(40.9); units.temp.tR = 'K'; label.temp.tR = 'temperature';
  comment.am = 'Data for H. bachmani';
data.am = 35*365;  units.am = 'd';   label.am = 'life span';             bibkey.am = 'Wiki';   
  temp.am = C2K(40.9); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Wwb = 34;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'TjorUnde2007';
data.Wwi = 670;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'AnAge';
  comment.am = 'Data for H. bachmani';
  
data.Ri  = 2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(40.9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.045	40.288
0.090	38.849
0.090	46.043
0.904	30.216
0.904	38.849
0.904	46.043
0.949	56.115
1.853	34.532
1.898	46.043
1.944	53.237
2.893	30.216
2.893	44.604
2.983	57.554
2.983	67.626
3.028	51.799
3.932	43.165
3.932	48.921
3.977	56.115
3.977	67.626
4.836	64.748
4.881	74.820
4.881	80.576
4.972	87.770
5.921	46.043
5.921	58.993
5.966	69.065
5.966	74.820
5.966	84.892
6.915	63.309
6.915	69.065
7.910	105.036
7.955	97.842
8.904	50.360
9.944	69.065
9.944	74.820
9.944	82.014
9.944	89.209
9.944	105.036
9.944	110.791
9.989	117.986
9.989	120.863
10.034	128.058
10.034	138.129
10.983	113.669
11.028	63.309
11.028	97.842
11.028	126.619
11.028	133.813
11.028	142.446
11.028	159.712
11.977	145.324
12.023	107.914
12.023	126.619
12.023	133.813
12.023	139.568
12.023	155.396
12.023	166.906
12.972	139.568
12.972	189.928
13.831	148.201
13.921	79.137
13.921	162.590
13.921	182.734
13.921	195.683
13.921	218.705
13.921	284.892
14.915	136.691
14.915	174.101
14.915	184.173
14.915	189.928
14.915	195.683
14.915	201.439
15.910	208.633
15.955	97.842
15.955	116.547
16.949	189.928
16.949	200.000
16.994	241.727
17.898	273.381
17.944	188.489
17.944	256.115
18.983	187.050
18.983	194.245
18.983	258.993
18.983	264.748
18.983	273.381
19.028	133.813
19.028	225.899
19.028	230.216
19.028	237.410
19.028	241.727
19.028	247.482
19.977	227.338
20.068	290.647
20.068	313.669
20.836	191.367
20.836	201.439
20.881	214.388
20.881	279.137
20.972	244.604
20.972	257.554
20.972	267.626
21.876	283.453
21.876	290.647
21.876	299.281
21.921	322.302
21.921	328.058
21.921	342.446
22.960	257.554
22.960	277.698
22.960	305.036
22.960	313.669
22.960	364.029
23.006	243.165
23.955	235.971
23.955	241.727
24.000	263.309
24.000	282.014
24.000	299.281
24.000	305.036
24.000	343.885
24.949	328.058
24.949	336.691
24.949	365.468
24.994	300.719
24.994	306.475
24.994	315.108
25.944	266.187
25.944	273.381
25.989	192.806
25.989	204.317
26.034	296.403
26.034	328.058
26.983	431.655
27.028	224.460
27.028	328.058
27.073	261.871
28.023	264.748
28.023	338.129
28.023	348.201
28.023	355.396
28.023	368.345
28.023	490.647
28.068	316.547
28.927	284.892
28.927	306.475
28.927	349.640
28.927	365.468
28.927	374.101
28.927	398.561
28.927	434.532
29.966	372.662
29.966	387.050
30.915	435.971
30.915	457.554
30.915	493.525
30.960	322.302
31.006	258.993
31.006	417.266
32.000	336.691
32.000	382.734
32.000	388.489
32.000	400.000
32.994	418.705
33.040	345.324
33.040	355.396
33.040	374.101
33.040	385.612
33.989	411.511
34.034	346.763
34.034	388.489
34.034	427.338
34.034	487.770
35.028	328.058
35.028	364.029
35.028	376.978
35.073	411.511
35.977	428.777
36.023	326.619
36.023	441.727
36.068	387.050
36.927	328.058
36.927	355.396
36.927	364.029
36.927	444.604
36.927	454.676
37.017	466.187
37.062	402.878
37.062	411.511
37.921	476.259
37.966	378.417
37.966	397.122
37.966	490.647
38.960	306.475
38.960	466.187
39.006	502.158
39.051	379.856
39.051	402.878
39.051	484.892
39.955	398.561
39.955	421.583
39.955	431.655];
n=size(data.tW,1); for i=2:n;if data.tW(i,1)<=data.tW(i-1,1); data.tW(i,1)=data.tW(i-1,1)+1e-3;end;end
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.9);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'TjorUnde2007';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'mod_1: v is reduced, food availavility taken variable in tW data';
D2 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '3J8XP'; % Cat of Life
metaData.links.id_ITIS = '560353'; % ITIS
metaData.links.id_EoL = '45515100'; % Ency of Life
metaData.links.id_Wiki = 'Haematopus_moquini'; % Wikipedia
metaData.links.id_ADW = 'Haematopus_moquini'; % ADW
metaData.links.id_Taxo = '70245'; % Taxonomicon
metaData.links.id_WoRMS = '212720'; % WoRMS
metaData.links.id_avibase = 'C078081EB45D895F'; % avibase
metaData.links.id_birdlife = 'african-oystercatcher-haematopus-moquini'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Haematopus_moquini}}';
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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Haematopus_bachmani}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'TjorUnde2007'; type = 'Article'; bib = [ ...  
'title = {Energetics of growth in semi-precocial shorebird chicks in a warm environment: {T}he {A}frican black oystercatcher, \emph{Haematopus moquini}}, ' ...
'journal = {Zoology}, ' ...
'volume = {110}, ' ...
'year = {2007}, ' ...
'author = {K. M.C. Tj{\o}rvea and L. G. Underhill and G. H. Visser}, ' ...
'pages = {176-188}'];
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

