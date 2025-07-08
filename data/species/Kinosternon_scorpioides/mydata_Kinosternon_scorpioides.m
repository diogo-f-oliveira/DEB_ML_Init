function [data, auxData, metaData, txtData, weights] = mydata_Kinosternon_scorpioides
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Kinosternidae';
metaData.species    = 'Kinosternon_scorpioides'; 
metaData.species_en = 'Scorpion mud turtle'; 

metaData.ecoCode.climate = {'Af','Am'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0bTd', 'biFp', 'biFc'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biSv'};
metaData.ecoCode.gender  = {'Dtmf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ww0'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Le'}; 

metaData.COMPLETE = 1.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 04 29];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 04 29];

%% set data
% zero-variate data

data.ab = 129.5;  units.ab = 'd';    label.ab = 'age at birth';                          bibkey.ab = 'BragFern2021';   
  temp.ab = C2K(30); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 44.7*365;  units.am = 'd';    label.am = 'life span';                          bibkey.am = 'AnAge';   
  temp.am = C2K(27); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb = 2.6; units.Lb = 'cm';   label.Lb = 'carapace length at birth';                 bibkey.Lb = 'BragFern2021';
data.Lp = 10.25; units.Lp = 'cm';  label.Lp = 'carapace length at puberty for females';     bibkey.Lp = 'Iver2010';
data.Lpm = 10.25; units.Lpm = 'cm';   label.Lpm = 'carapace length at puberty for males';   bibkey.Lpm = 'Iver2010';
data.Li = 11; units.Li = 'cm';   label.Li = 'ultimate carapace length for females';        bibkey.Li = 'Iver2010';
data.Lim = 10.8; units.Lim = 'cm';   label.Lim = 'ultimate carapace length for males';       bibkey.Lim = 'Iver2010';

data.Ww0 = 5.5; units.Ww0 = 'g';   label.Ww0 = 'intial wet weight';                     bibkey.Ww0 = 'Iver2010';
data.Wwi = 225; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';        bibkey.Wwi = 'Iver2010';
  comment.Wwi = 'based on 0.000102*(10*Li)^3.108, see F1';

data.Ri  = 2.2*5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';                   bibkey.Ri  = 'Iver2010';   
  temp.Ri = C2K(27);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1-4 eggs per clutch, 5 clutches per yr';
 
% univariate data
% time-length data
data.tL = [ ... % time since birth (yr), plastron length (cm)
0.000	2.313
0.000	2.432
0.000	2.265
1.000	6.354
1.000	5.924
1.000	3.799
1.000	4.396
1.000	5.208
2.000	6.980
2.000	7.506
2.000	6.169
2.000	4.186
2.000	6.145
3.000	7.105
3.000	7.368
4.000	8.615
4.000	8.209
5.000	9.050
6.000	9.199
8.000	9.591
8.000	8.421];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
data.tL(:,2) = data.tL(:,2)/ 0.95; % convert plastron to carapace length
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'carapace length'};  
temp.tL   = C2K(27);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Iver2010';
comment.tL = 'Data for Kinosternon scorpioides cruentatum on the Yucatan Peninsula';

% time-length data for embryo
data.tLe = [ ... % age (d), carapace length (cm)
39.646	1.447
39.785	0.994
39.785	1.488
40.062	1.226
40.200	1.195
44.769	0.984
44.908	1.266
44.908	1.327
44.908	1.357
44.908	1.392
49.615	1.579
50.031	1.669
50.169	1.775
53.908	1.599
54.877	1.468
54.877	1.549
54.877	1.645
54.877	2.375
55.015	1.836
55.015	1.907
55.015	2.158
55.154	1.705
55.154	1.992
64.708	1.716
64.708	1.796
69.554	2.396
69.554	2.527
69.554	2.567
69.831	2.436
69.969	1.877
74.538	2.437
74.538	2.462
74.677	2.563
74.677	2.583
74.815	2.799
75.092	2.351
75.092	2.996
79.800	3.001
79.800	2.578
79.938	1.792
80.077	2.669
84.646	2.553
84.923	2.397
84.923	2.457
84.923	2.951
89.769	2.503
90.185	2.296
90.185	3.123
95.308	2.795
99.877	2.871
99.877	2.901
100.154	2.957
105.138	2.761
110.262	2.932
114.692	2.610
114.692	2.781
124.800	3.256
124.800	3.291
134.908	2.420
134.908	2.994
134.908	3.034
135.046	2.798
135.046	2.833
135.046	2.878
144.877	2.219];
% make sure that times are different
n = size(data.tLe,1); for i=2:n; if data.tLe(i,1) <= data.tLe(i-1,1); data.tLe(i,1) = data.tLe(i-1,1) + 1e-3; end; end; 
units.tLe  = {'d', 'cm'};  label.tLe = {'time since birth', 'embryo carapace length'};  
temp.tLe   = C2K(30);  units.temp.tLe = 'K'; label.temp.tLe = 'temperature';
bibkey.tLe = 'BragFern2021';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hb only'; 
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: wet weight (in g) = 0.000102 * (carapace ength in mm)^3.108';
metaData.bibkey.F1 = 'Iver2010'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3R86W'; % Cat of Life
metaData.links.id_ITIS = '551809'; % ITIS
metaData.links.id_EoL = '1056209'; % Ency of Life
metaData.links.id_Wiki = 'Kinosternon_scorpioides'; % Wikipedia
metaData.links.id_ADW = 'Kinosternon_scorpioides'; % ADW
metaData.links.id_Taxo = '48360'; % Taxonomicon
metaData.links.id_WoRMS = '1476239'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Kinosternon&species=scorpioides'; % ReptileDB
metaData.links.id_AnAge = 'Kinosternon_scorpioides'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Kinosternon_scorpioides}}';
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
bibkey = 'Iver2010'; type = 'Article'; bib = [ ... 
'author = {John B. Iverson}, ' ... 
'year = {2010}, ' ...
'title = {Reproduction in the Red-Cheeked Mud Turtle (\emph{Kinosternon scorpioides cruentatum}) in {S}outheastern {M}exico and {B}elize, with Comparisons Across the Species Range}, ' ...
'journal = {Chelonian Conservation and Biology}, ' ...
'volume = {9(2)}, ' ...
'pages = {250-261}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BragFern2021'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s00435-021-00517-5}, ' ...
'author = {Brenda Stefany dos Santos Braga and D\''{a}rio Lisboa Fernandes?Neto and Relionan Pimentel Leal Samantha Ribeiro Silva and Maria Auxiliadora Pantoja Ferreira and Ver\^{o}nica Regina Oliveira?Bahia and Jos\''{e} Ribamar Felipe Marques and Diva Anelie de Ara\''{u}jo Guimar\~{a}es}, ' ... 
'year = {2021}, ' ...
'title = {Embryonic development of \emph{Kinosternon scorpioides} ({T}estudines: {K}inosternidae)}, ' ...
'journal = {Zoomorphology}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Kinosternon_scorpioides}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

