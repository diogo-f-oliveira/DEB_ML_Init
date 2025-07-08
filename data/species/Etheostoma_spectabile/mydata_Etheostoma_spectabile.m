  function [data, auxData, metaData, txtData, weights] = mydata_Etheostoma_spectabile
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Percidae';
metaData.species    = 'Etheostoma_spectabile'; 
metaData.species_en = 'Orangethroat darter'; 

metaData.ecoCode.climate = {'Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFc'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L_T'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2020 06 27];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 06 27]; 

%% set data
% zero-variate data
data.am = 4*365;   units.am = 'd';  label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 0.6;  units.Lb = 'cm'; label.Lb = 'total length at birth';        bibkey.Lb = 'West1966'; 
data.Lp = 3.9;  units.Lp = 'cm'; label.Lp = 'total length at puberty';      bibkey.Lp = 'guess'; 
  comment.Lp = 'based on same relative length, compared to E.rubrum';
data.Li = 7.2;    units.Li = 'cm'; label.Li = 'ultimate total length';      bibkey.Li = 'fishbase';

data.Wwb = 1.2e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.3 mm: pi/6*0.13^3';
data.Wwi = 2.5; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'fishbase';
   comment.Wwi = 'relationship 0.00513*Li^3.14 (see F1)';

data.Ri = 250/365;   units.Ri = '#/d';  label.Ri = 'max reproduction rate'; bibkey.Ri = 'Wiki';
  temp.Ri = C2K(18); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data

% time-length
data.tL_27 = [ ... % time since birth (d), total length (cm)
 0	0.600
 7	0.819
14	1.350
21	1.456
28	1.563
35	1.721
42	1.793];
units.tL_27 = {'d', 'cm'}; label.tL_27 = {'time since birth', 'total length', '27 C'};  
temp.tL_27 = C2K(27);  units.temp.tL_27 = 'K'; label.temp.tL_27 = 'temperature';
bibkey.tL_27 = 'West1966';
%
data.tL_25 = [ ... % time since birth (d), total length (cm)
 0	0.600
 7	0.852
14	1.350
21	1.584
28	1.636
35	2.158
42	1.976];
units.tL_25 = {'d', 'cm'}; label.tL_25 = {'time since birth', 'total length', '25 C'};  
temp.tL_25 = C2K(25);  units.temp.tL_25 = 'K'; label.temp.tL_25 = 'temperature';
bibkey.tL_25 = 'West1966';
%
data.tL_24 = [ ... % time since birth (d), total length (cm)
 0	0.600
 7	0.876
14	1.575
21	1.875
28	2.046
35	2.158
42	2.134];
units.tL_24 = {'d', 'cm'}; label.tL_24 = {'time since birth', 'total length', '24 C'};  
temp.tL_24 = C2K(24);  units.temp.tL_24 = 'K'; label.temp.tL_24 = 'temperature';
bibkey.tL_24 = 'West1966';
%
data.tL_23 = [ ... % time since birth (d), total length (cm)
 0	0.600
 7	0.782
14	1.280
21	1.763
28	1.957
35	2.033
42	1.787];
units.tL_23 = {'d', 'cm'}; label.tL_23 = {'time since birth', 'total length', '23 C'};  
temp.tL_23 = C2K(23);  units.temp.tL_23 = 'K'; label.temp.tL_23 = 'temperature';
bibkey.tL_23 = 'West1966';
%
data.tL_21 = [ ... % time since birth (d), total length (cm)
 0	0.600
 7	0.803
14	1.125
21	1.541
28	1.560
35	1.757
42	1.827];
units.tL_21 = {'d', 'cm'}; label.tL_21 = {'time since birth', 'total length', '21 C'};  
temp.tL_21 = C2K(21);  units.temp.tL_21 = 'K'; label.temp.tL_21 = 'temperature';
bibkey.tL_21 = 'West1966';
%
data.tL_19 = [ ... % time since birth (d), total length (cm)
 0	0.600
 7	0.822
14	1.098
21	1.447
28	1.478
35	1.593
42	1.648];
units.tL_19 = {'d', 'cm'}; label.tL_19 = {'time since birth', 'total length', '19 C'};  
temp.tL_19 = C2K(19);  units.temp.tL_19 = 'K'; label.temp.tL_19 = 'temperature';
bibkey.tL_19 = 'West1966';
%
data.tL_15 = [ ... % time since birth (d), total length (cm)
 0	0.600
 7	0.679
14	0.831
21	0.977
28	1.074
35	1.229
42	1.289];
units.tL_15 = {'d', 'cm'}; label.tL_15 = {'time since birth', 'total length', '15 C'};  
temp.tL_15 = C2K(15);  units.temp.tL_15 = 'K'; label.temp.tL_15 = 'temperature';
bibkey.tL_15 = 'West1966';
%
data.tL_13 = [ ... % time since birth (d), total length (cm)
 0	0.600
 7	0.706
14	0.858
21	1.016
28	1.031
35	1.326
42	1.417];
units.tL_13 = {'d', 'cm'}; label.tL_13 = {'time since birth', 'total length', '13 C'};  
temp.tL_13 = C2K(13);  units.temp.tL_13 = 'K'; label.temp.tL_13 = 'temperature';
bibkey.tL_13 = 'West1966';

%% set weights for all real data
weights = setweights(data, []);
weights.Lb = 50 * weights.Lb;
weights.tL_24 = 10 * weights.tL_24;
weights.Wwb = 0 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_27', 'tL_25','tL_24', 'tL_23','tL_21', 'tL_19','tL_15', 'tL_13'}; subtitle1 = {'Data for 27, 25, 24, 23, 21, 19, 15, 13 C'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by E_Hp only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight for E.rubrum: Ww in g = 0.00513 * (TL in cm)^3.14';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length for E.rubrum: TL = 1.15 * SL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '3BL6Z'; % Cat of Life
metaData.links.id_ITIS = '168368'; % ITIS
metaData.links.id_EoL = '203737'; % Ency of Life
metaData.links.id_Wiki = 'Etheostoma_spectabile'; % Wikipedia
metaData.links.id_ADW = 'Etheostoma_spectabile'; % ADW
metaData.links.id_Taxo = '174154'; % Taxonomicon
metaData.links.id_WoRMS = '954587'; % WoRMS
metaData.links.id_fishbase = 'Etheostoma-spectabile'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Etheostoma_spectabile}}';  
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
bibkey = 'West1966'; type = 'article'; bib = [ ...  
'author = {Boyce W. West}, ' ...
'year = {1966}, ' ...
'title = {GROWTH RATES AT VARIOUS TEMPERATURES OF THE ORANGE-THROAT DARTER \emph{Etheostoma spectabile} ({A}GASSIZ)}, ' ... 
'journal = {Arkansas Academy of Science Proceedings}, ' ...
'volume = {20}, '...
'pages = {50-53}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Etheostoma-spectabile.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
