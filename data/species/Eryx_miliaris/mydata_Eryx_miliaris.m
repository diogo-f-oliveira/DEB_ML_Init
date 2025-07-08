function [data, auxData, metaData, txtData, weights] = mydata_Eryx_miliaris
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Boidae';
metaData.species    = 'Eryx_miliaris'; 
metaData.species_en = 'Dwarf sand boa'; 

metaData.ecoCode.climate = {'BWk','BSh'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'biTs','biTd'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCv','biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(30); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 12 26];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 09];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 09];

%% set data
% zero-variate data

data.ab = 120;     units.ab = 'd';    label.ab = 'age at birth';  bibkey.ab = 'Harr2001';
  temp.ab = C2K(30); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 730;   units.tp = 'd';    label.tp = 'time since birth at puberty';  bibkey.tp = 'Harr2001';
  temp.tp = C2K(30); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 24*365;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'guess';   
  temp.am = C2K(30); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on values for Eryx tataricus in AnAge';

data.Wwb = 7;    units.Wwb = 'g';  label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'Harr2001';
data.Wwi = 180;    units.Wwi = 'g';  label.Wwi = 'ultimate wet for females'; bibkey.Wwi = 'Harr2001';
data.Wwim = 50;    units.Wwim = 'g';  label.Wwim = 'ultimate wet for males'; bibkey.Wwim = 'Harr2001';
  
data.Ri  = 9/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(30);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '7-10 young per clutch, 1 clutch per yr assumed';

% univariate data
% time-weight
data.tW_f = [ ... % time since birth (yr), weight (g)];
0.100	13.107
0.139	21.359
0.279	22.330
0.395	33.981
0.540	38.835
0.725	55.825
0.847	65.534
1.004	75.243
1.138	86.408
1.323	92.233
1.451	106.311
1.637	112.136
1.794	120.388
1.974	124.272
2.090	143.204
2.229	139.806
2.357	145.631
2.485	157.282
2.619	148.058
2.776	150.971
2.880	158.738
3.031	163.107
3.148	131.553
3.252	153.398
3.391	179.126
3.525	179.612
3.682	187.379
3.803	206.311
3.933	146.117
4.113	150.485
4.206	158.738
4.322	163.592
4.462	132.524
4.717	180.097
4.856	181.068
4.978	186.408
5.106	200.485];
data.tW_f(:,1) = data.tW_f(:,1) * 365; % convert mnth to d
units.tW_f  = {'d', 'g'};  label.tW_f = {'time since birth', 'weight', 'females'};  
temp.tW_f   = C2K(30);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'Harr2001'; 
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time since birth (yr), weight (g)];
0.100	 9.709
0.133	15.534
0.290	13.592
0.430	27.184
0.557	33.981
0.674	35.437
0.755	42.718
1.034	43.204
1.144	38.350
1.296	38.835
1.447	39.320
1.615	44.175
1.766	43.204
1.993	43.204
2.232	43.204
2.499	45.146
2.796	34.951
3.022	44.660
3.139	40.291
3.255	42.233
3.429	50.485
3.633	50.000
3.801	52.913
3.941	40.291
4.075	35.437
4.214	39.320
4.336	44.175
4.493	40.291
4.633	44.660
4.743	50.000
4.952	50.485
5.098	50.971];
data.tW_m(:,1) = data.tW_m(:,1) * 365; % convert mnth to d
units.tW_m  = {'d', 'g'};  label.tW_m = {'time since birth', 'weight', 'males'};  
temp.tW_m   = C2K(30);  units.temp.tW_m = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_m = 'Harr2001'; 
comment.tW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_f = 8 * weights.tW_f;
weights.tW_m = 3 * weights.tW_m;
weights.ab = 5 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

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
D1 = 'Males are supposed to differ from females by {p_Am} and v only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = '';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3BG9G'; % Cat of Life
metaData.links.id_ITIS = '951271'; % ITIS
metaData.links.id_EoL = '455985'; % Ency of Life
metaData.links.id_Wiki = 'Eryx_miliaris'; % Wikipedia
metaData.links.id_ADW = 'Eryx_miliaris'; % ADW
metaData.links.id_Taxo = '644240'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Eryx&species=miliaris'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Eryx_miliaris}}';
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
bibkey = 'Harr2001'; type = 'Misc'; bib = [ ...
'author = {Chris Harrison}, ' ...
'year = {2001}, ' ...
'howpublished = {\url{http://www.kingsnake.com/sandboa/breeding.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Eryx_miliaris}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
