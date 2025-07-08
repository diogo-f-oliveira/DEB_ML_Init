function [data, auxData, metaData, txtData, weights] = mydata_Probosciger_aterrimus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Psittaciformes'; 
metaData.family     = 'Cacatuidae';
metaData.species    = 'Probosciger_aterrimus'; 
metaData.species_en = 'Palm cockatoo'; 

metaData.ecoCode.climate = {'Am', 'Af'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnwfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.3); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 06 06];              
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

data.ab = 32;    units.ab = 'd';    label.ab = 'age at birth';                        bibkey.ab = 'ADW';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 100;    units.tx = 'd';    label.tx = 'time since birth at fledging';       bibkey.tx = 'ADW';   
  temp.tx = C2K(41.3);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 300;    units.tp = 'd';    label.tp = 'time since birth at puberty';       bibkey.tp = 'guess';   
  temp.tp = C2K(41.3);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 7.5*365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'ADW';
  temp.tR = C2K(41.3);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 56.3*365;    units.am = 'd';    label.am = 'life span';                     bibkey.am = 'AnAge';   
  temp.am = C2K(41.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 19;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth for P.a.g';       bibkey.Wwb = 'Tayl1998';
data.Wwi = 750;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for P.a.g';     bibkey.Wwi = 'Tayl1998';

data.Ri = 1/365/2; units.Ri = '#/d'; label.Ri  = 'maximum reprod rate';               bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(41.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Wiki: 1 eggs/clutch; breeds once per 2 yr';
 
% uni-variate data
% time-weight
data.tW_Pag = [ ... % time since birth (d), wet weight (g)
0.024	19.174
1.063	21.186
2.144	22.868
3.183	24.219
4.329	26.565
5.410	28.909
6.513	32.906
7.595	36.903
8.719	40.570
9.780	45.558
10.883	50.878
11.986	54.214
13.047	60.855
14.150	66.505
15.254	73.477
16.315	80.118
17.418	85.438
18.563	91.420
19.603	98.721
20.707	105.694
21.789	113.658
22.850	122.282
23.935	147.436
28.000	196.241
34.846	271.915
41.885	340.825
48.923	370.262
55.962	409.849
62.808	440.410
69.910	491.277
76.885	510.562
83.859	544.509
90.834	580.712
97.936	577.443];
units.tW_Pag   = {'d', 'g'};  label.tW_Pag = {'time since birth', 'wet weight', 'P. a. goliath'};  
temp.tW_Pag    = C2K(41.3);  units.temp.tW_Pag = 'K'; label.temp.tW_Pag = 'temperature';
bibkey.tW_Pag  = 'Tayl1998';
comment.tW_Pag = 'Data for P. a. goliath';
%
data.tW_Paa = [ ... % time since birth (d), wet weight (g)
0.023	14.876
1.083	16.228
2.186	17.250
3.289	19.925
4.349	20.615
5.452	23.951
6.555	26.296
7.658	30.293
8.739	31.645
9.800	37.955
10.882	41.622
12.006	45.950
13.088	50.938
14.170	54.935
15.294	60.586
16.355	66.566
17.416	70.562
18.519	75.551
19.622	80.871
20.726	89.165
22.890	102.448
23.974	123.635
27.936	152.255
34.910	208.758
42.013	260.752
48.923	313.871
55.962	350.075
62.936	389.661
70.102	402.182
77.013	418.083
84.051	428.347
91.026	445.376
98.128	454.513];
units.tW_Paa   = {'d', 'g'};  label.tW_Paa = {'time since birth', 'wet weight', 'P. a. aterrim'};  
temp.tW_Paa    = C2K(41.3);  units.temp.tW_Paa = 'K'; label.temp.tW_Paa = 'temperature';
bibkey.tW_Paa  = 'Tayl1998';
comment.tW_Paa = 'Data for P. a. aterrim';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW_Pag = weights.tW_Pag * 2;
weights.tW_Paa = weights.tW_Paa * 2;

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
set1 = {'tW_Pag','tW_Paa'}; subtitle1 = {'Data for P. a. goliath, P. a. aterrimus'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'P. a. goliath is assumed to differ from P. a. aterrim by {p_Am} only';
D2 = 'Body temperatures are guessed';
D3 = 'mod_1: v is reduced; food availability taken variable in tW data; Wwx removed';
D4 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Facts
F1 = '4 sub-species are recognized; this entry has Cape York cockatoo (P. a. aterrimus) and goliath cockatoo (P. a. goliath)';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'Both male and female partake in breeding; nest in big hollow trees';
metaData.bibkey.F2 = 'MurpLegg2003'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '77Y7H'; % Cat of Life
metaData.links.id_ITIS = '554832'; % ITIS
metaData.links.id_EoL = '45516619'; % Ency of Life
metaData.links.id_Wiki = 'Probosciger_aterrimus'; % Wikipedia
metaData.links.id_ADW = 'Probosciger_aterrimus'; % ADW
metaData.links.id_Taxo = '54193'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'ADC0F2618675AC3B'; % avibase
metaData.links.id_birdlife = 'palm-cockatoo-probosciger-aterrimus'; % birdlife
metaData.links.id_AnAge = 'Probosciger_aterrimus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Probosciger_aterrimus}}';
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
bibkey = 'MurpLegg2003'; type = 'Article'; bib = [ ... 
'author = {S. Murphy and S. Legge and R. Heinsohn}, ' ... 
'year = {2003}, ' ...
'title = {The breeding biology of palm cockatoos (\emph{Probosciger aterrimus}): a case of a slow life history}, ' ...
'journal = {J. Zool., Lond.}, ' ...
'volume = {261}, ' ...
'pages = {327-339}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Tayl1998'; type = 'Techreport'; bib = [ ... 
'author = {Taylor, M.}, ' ... 
'year = {1998}, ' ...
'title = {American Zoo and Aquarium Association''s Palm cockatoo; Husbandry manual}, ' ...
'institution = {Caloosahatchee Aviary and Botanical Gardens and the International Aviculturists Society}, ' ...
'howpublished = {\url{http://aviansag.org/Husbandry/Unlocked/Care_Manuals/Palm_Cockatoo_Husbandry_Manual.pdf}}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Probosciger_aterrimus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Probosciger_aterrimus/}}';
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

