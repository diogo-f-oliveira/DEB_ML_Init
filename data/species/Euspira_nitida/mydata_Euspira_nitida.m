function [data, auxData, metaData, txtData, weights] = mydata_Euspira_nitida

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Littorinimorpha'; 
metaData.family     = 'Naticidae';
metaData.species    = 'Euspira_nitida'; 
metaData.species_en = 'Common necklace shell';

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MANE', 'MAm'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb', 'jiMi'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPp', 'jiHa'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16); % K, body temp
metaData.data_0     = {'ab_T'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm = [2017 02 02];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 02 02]; 

%% set data
% zero-variate data

data.ab14 = 14;   units.ab14 = 'd';    label.ab14 = 'age at birth';             bibkey.ab14 = 'KingRich2005';   
  temp.ab14 = C2K(14);  units.temp.ab14 = 'K'; label.temp.ab14 = 'temperature';
data.ab20 = 9;    units.ab20 = 'd';    label.ab20 = 'age at birth';             bibkey.ab20 = 'KingRich2005';   
  temp.ab20 = C2K(20);  units.temp.ab20 = 'K'; label.temp.ab20 = 'temperature';
data.tp = 70;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(16);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 6*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'Wiki_nl';   
  temp.am = C2K(16);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 1.6;    units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'Wiki_nl';

data.Wwb = 8.2e-6; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'ADW';
  comment.Wwb = 'Based on egg diameter of 250 mum for E. lewisii: 4/3 * pi * (0.0125)^3';
data.Wwi = 1.5;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'RobiGree2010';
  comment.Wwi = 'Based on log10(W in g) = a + b log10(L in mm), with a = -2.629, b = 2.321, L = 16 mm';

data.Ri  = 1e5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'guess';   
  temp.Ri = C2K(16);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% t-L data
data.tL = [ ... % time since birth (yr), length (cm)
0.154	0.199
6.918	0.281
7.046	0.241
7.047	0.251
7.053	0.303
14.069	0.268
14.078	0.345
14.086	0.419
20.975	0.431
21.086	0.245
21.103	0.398
28.129	0.446
28.130	0.462
28.139	0.542
35.162	0.565
35.290	0.529
35.310	0.711
42.051	0.582
42.193	0.669
42.194	0.684
49.092	0.774
49.231	0.833
56.123	0.874
56.126	0.906
57.041	0.791
63.008	0.858
63.159	1.023
64.069	0.866
70.032	0.889
70.163	0.878
77.058	0.951
77.063	0.989
84.088	1.035
91.119	1.136
98.268	1.114
105.290	1.131];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell length'};  
temp.tL    = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL  = 'KingRich2005';
comment.tL = 'Metamorphosis and settlement at 45 d since birth';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Poor fit of tL data for neonates is likely due to the assumption of constant shap coefficient, while shape of veliger differs from that of the snail';
D2 = 'Energy conductance was fixed to avoid very low values that match long incubation times; delay of start development is probably involved';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'Drills holes mechanically and eats other molluscs; cannibalistic';
metaData.bibkey.F1 = 'Wiki_nl'; 
metaData.facts = struct('F1',F1);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '6HGP7'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '6990612'; % Ency of Life
metaData.links.id_Wiki = 'Euspira_nitida'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '3957234'; % Taxonomicon
metaData.links.id_WoRMS = '151894'; % WoRMS
metaData.links.id_molluscabase = '151894'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Euspira_nitida}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Wiki_nl'; type = 'Misc'; bib = ...
'howpublished = {\url{https://nl.wikipedia.org/wiki/Glanzende_tepelhoren}}';
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
bibkey = 'KingRich2005'; type = 'Article'; bib = [ ... 
'author = {P. R. Kingsley-Smith and C. A. Richardson and R. Seed}, ' ... 
'year = {2005}, ' ...
'title = {Growth and development of the veliger larvae and juveniles of \emph{Polinices pulchellus} ({G}astropoda: {N}aticidae)}, ' ...
'journal = {J. Mar. Biol. Ass. U.K.}, ' ...
'volume = {85}, ' ...
'pages = {171--174}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RobiGree2010'; type = 'Article'; bib = [ ... 
'author = {L. A. Robinson and S. P. R. Greenstreet and H. Reiss and R. Callaway and J. Craeymeersch and I. de Boois and S. Degraer and S. Ehrich and H. M. Fraser and A. Goffin and I. Kroncke and L. L. Jorgenson and M. R. Robertson and J. Lancaster}, ' ... 
'year = {2010}, ' ...
'title = {Length-weight relationships of 216 {N}orth {S}ea benthic invertebrates and fish}, ' ...
'journal = {J. Mar. Biol. Ass. U.K.}, ' ...
'volume = {90}, ' ...
'pages = {95-104}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Euspira_lewisii/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

