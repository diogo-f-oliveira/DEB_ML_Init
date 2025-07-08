function [data, auxData, metaData, txtData, weights] = mydata_Melanerpes_formicivorus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Piciformes'; 
metaData.family     = 'Picidae';
metaData.species    = 'Melanerpes_formicivorus'; 
metaData.species_en = 'Acorn woodpecker'; 

metaData.ecoCode.climate = {'Aw', 'BSk', 'BSh', 'Csa', 'Cfa'};
metaData.ecoCode.ecozone = {'THn','TN'};
metaData.ecoCode.habitat = {'0iTi', '0iTh'};
metaData.ecoCode.embryo  = {'Tnwfm', 'Tntfm'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCii','biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.8); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 08 11];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 11 30];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 05];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 05];

%% set data
% zero-variate data

data.ab = 14;  units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'AnAge';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temp from SchwWeav1977'; 
data.tx = 28;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'BarbDuer2020';   
  temp.tx = C2K(41.8);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'temperature from DaanMasm1991,DawsWhit1999';
data.tp = 84;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.8);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'temperature from DaanMasm1991,DawsWhit1999';
data.tR = 1.9*365;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'avibase';
  temp.tR = C2K(41.8);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 17.2*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(41.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 4.7; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'avibase';
data.Wwi = 79; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight for female';     bibkey.Wwi = 'avibase';

data.Ri  = 2*4.9/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = {'avibase','AnAge'};   
  temp.Ri = C2K(41.8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3-7 eggs per clutch, 1-2 clutches per yr';
 
% uni-variate data
% time weight
data.tW = [ ... % scaled time since birth (d), scaled wet weight (g)
1.065	13.308
2.129	16.131
2.776	20.996
3.726	24.073
4.297	26.635
4.829	29.709
5.513	30.738
6.084	33.811
6.958	40.213
7.757	46.613
8.973	55.319
10.000	61.722
10.722	65.820
11.863	69.155
13.042	69.421
13.612	73.006
14.259	76.848
15.209	78.902
16.008	83.257
16.578	87.098
17.186	89.661
18.061	88.901
18.745	89.162
19.734	90.450
20.532	92.247
21.863	88.933
22.966	86.897
24.183	83.582
25.817	77.714
27.833	74.662];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight', 'ind 1'};  
temp.tW    = C2K(41.8);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'BarbDuer2020';
%
data.tW1 = [ ... % scaled time since birth (d), scaled wet weight (g)
1.065	9.728
1.787	11.268
2.433	13.831
3.004	17.928
4.030	22.029
5.019	26.641
6.084	30.742
6.540	36.373
7.224	41.750
7.909	45.847
8.669	51.481
9.468	57.370
10.266	63.003
11.407	67.616
12.586	68.649
13.232	70.190
14.030	74.800
14.639	76.851
15.209	79.158
16.160	80.189
16.540	82.494
17.110	84.289
17.719	83.016
18.213	83.275
19.049	85.073
20.038	89.685
20.837	91.226
21.749	89.188
24.106	88.952
24.867	86.913
25.399	89.986
25.932	91.525
26.844	86.162
27.681	84.123];
units.tW1   = {'d', 'g'};  label.tW1 = {'time since birth', 'wet weight', 'ind 2'};  
temp.tW1    = C2K(41.8);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1  = 'BarbDuer2020';

%% set weights for all real data
weights = setweights(data, []);
%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;
weights.tW1 = weights.tW1 * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 2;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW','tW1'}; subtitle1 = {'Individual 1, 2'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'mod_1: Food availability taken variable in tW1 data, constant in tW';
D2 = 'mod_1: v is reduced';
D3 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '3Z72G'; % Cat of Life
metaData.links.id_ITIS = '178189'; % ITIS
metaData.links.id_EoL = '45509727'; % Ency of Life
metaData.links.id_Wiki = 'Melanerpes_formicivorus'; % Wikipedia
metaData.links.id_ADW = 'Melanerpes_formicivorus'; % ADW
metaData.links.id_Taxo = '55687'; % Taxonomicon
metaData.links.id_WoRMS = '1534814'; % WoRMS
metaData.links.id_avibase = '7E3273031F76242B'; % avibase
metaData.links.id_birdlife = 'acorn-woodpecker-melanerpes-formicivorus'; % birdlife
metaData.links.id_AnAge = 'Melanerpes_formicivorus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Melanerpes_formicivorus}}';
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
bibkey = 'BarbDuer2020'; type = 'Incollection'; bib = [ ... 
'doi = {10.1002/9781119167792}, ' ...
'author = {Nancy Barbachano and Rebecca S. Duerr}, ' ... 
'year = {2020}, ' ...
'title = {Woodpeckers}, ' ...
'booktitle = {Hand-Rearing Birds}, ' ...
'editor = {Duerr, R. S. and Gage, L. J. }, ' ...
'pages = {575-586}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Melanerpes_formicivorus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=7E3273031F76242B&sec=lifehistory}}';
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

