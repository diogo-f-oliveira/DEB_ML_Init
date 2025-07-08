function [data, auxData, metaData, txtData, weights] = mydata_Spizella_pusilla

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Passerellidae';
metaData.species    = 'Spizella_pusilla'; 
metaData.species_en = 'Field sparrow'; 

metaData.ecoCode.climate = {'Cfa', 'Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTh', '0iTi', '0iTs'};
metaData.ecoCode.embryo  = {'Tnpf', 'Tnsf'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCi', 'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.5); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 08 21];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 11 26];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 08 30];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2023 08 30]; 

%% set data
% zero-variate data

data.ab = 12;   units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'AnAge';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 7.5;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'avibase';   
  temp.tx = C2K(40.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '7-8 d';
data.tp = 7.5*3;    units.tp= 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'AnAge';
  temp.tR = C2K(40.5);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 10.3*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'AnAge';   
  temp.am = C2K(40.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 1.71;  units.Ww0 = 'g';   label.Ww0 = 'initial wet weight';      bibkey.Ww0 = 'avibase';
data.Wwb = 1.2;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'DawsEvan1957';
data.Wwi = 12.28;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'avibase';

data.Ri  = 2*4/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(40.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4 eggs per clutch; 2 clutches per yr';

% uni-variate data

% time-weight
data.tW = [ % time since birth (d), wet weight  (g)
0.000	1.187
0.008	1.906
0.018	1.373
0.018	1.373
0.018	1.373
0.020	1.576
0.020	1.576
0.020	1.576
0.020	1.626
0.020	1.626
0.020	1.626
0.021	1.660
0.021	1.773
0.038	2.174
0.038	2.174
0.038	2.174
0.973	2.401
0.973	2.401
0.973	2.401
0.973	2.401
0.973	2.443
0.973	2.443
0.973	2.443
0.973	2.582
0.974	2.776
0.974	2.776
0.990	3.176
1.015	2.113
1.030	2.264
1.030	2.264
1.967	3.262
1.970	4.084
1.970	4.084
1.970	4.213
1.970	4.213
1.970	4.213
1.971	4.609
1.971	4.609
1.972	4.771
1.972	4.771
1.972	4.771
1.973	5.166
1.983	3.495
1.984	3.824
1.988	5.574
2.013	3.694
2.013	3.694
2.013	3.733
2.013	3.733
2.013	3.945
2.965	5.665
2.977	4.588
2.979	5.568
2.980	5.987
2.981	6.155
2.981	6.371
2.981	6.371
2.994	5.360
2.996	6.505
3.006	4.478
3.007	4.933
3.961	8.392
3.962	8.900
3.974	7.487
3.974	7.487
3.975	7.968
3.975	7.968
3.975	8.191
3.987	6.387
3.987	6.566
3.988	6.750
3.988	6.939
3.988	7.158
4.016	6.453
4.955	10.279
4.967	8.708
4.968	9.045
4.968	9.461
4.968	9.693
4.981	8.098
5.945	9.852
5.960	9.550
5.988	8.973
5.988	9.162
5.988	9.162
5.988	9.162
5.989	9.386
6.967	10.692
6.981	10.293];
for i=2:size(data.tW,1); if data.tW(i,1)<=data.tW(i-1,1); data.tW(i,1)=data.tW(i-1,1)+1e-8; end; end
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW = C2K(40.5);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'DawsEvan1957';
  
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
D1 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '6ZCJC'; % Cat of Life
metaData.links.id_ITIS = '179443'; % ITIS
metaData.links.id_EoL = '45511210'; % Ency of Life
metaData.links.id_Wiki = 'Spizella_pusilla'; % Wikipedia
metaData.links.id_ADW = 'Spizella_pusilla'; % ADW
metaData.links.id_Taxo = '85907'; % Taxonomicon
metaData.links.id_WoRMS = '1484586'; % WoRMS
metaData.links.id_avibase = 'E23F6DE0B4829658'; % avibase
metaData.links.id_birdlife = 'field-sparrow-spizella-pusilla'; % birdlife
metaData.links.id_AnAge = 'Spizella_pusilla'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Spizella_pusilla}}';
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
bibkey = 'DawsEvan1957'; type = 'Article'; bib = [ ... 
'doi = {10.1086/physzool.30.4.30152213}, ' ...
'author = {Dawson, W. R. and Evans, F. C.}, ' ... 
'year = {1957}, ' ...
'title = {Relation of Growth and Development to Temperature Regulation in Nestling Field and Chipping Sparrows}, ' ...
'journal = {Physiological Zoology}, ' ...
'volume = {30(4)}, ' ...
'pages = {315–327}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Spizella_pusilla}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=E23F6DE0B4829658&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

