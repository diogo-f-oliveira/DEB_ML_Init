  function [data, auxData, metaData, txtData, weights] = mydata_Etheostoma_raneyi
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Percidae';
metaData.species    = 'Etheostoma_raneyi'; 
metaData.species_en = 'Yazoo darter'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr', '0iFc'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 07 04];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data
data.tp = 0.5*365;   units.tp = 'd';  label.tp = 'time since birth at puberty';     bibkey.tp = 'JohnHaag1996';   
  temp.tp = C2K(21); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on Lp and tL data';
data.am = 2.5*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'JohnHaag1996';   
  temp.am = C2K(21); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'Wiki gives 5 yrs';
  
data.Lp = 3;  units.Lp = 'cm'; label.Lp = 'standard length at puberty';  bibkey.Lp = 'JohnHaag1996'; 
data.Li = 5.5;    units.Li = 'cm'; label.Li = 'ultimate standard length';  bibkey.Li = 'fishbase';
  comment.Li = 'fishbase TL 6.5 cm, see F1';

data.Wwb = 6e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'JohnHaag1996';
  comment.Wwb = 'based on egg diameter of 1.05 mm: pi/6*0.105^3';
data.Wwi = 1.8;  units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00513*(5.5/0.85)^3.14, see F1, F2';

data.Ri = 52/365;units.Ri = '#/d'; label.Ri = 'maximum reprod rate';    bibkey.Ri = 'JohnHaag1996';   
  temp.Ri = C2K(21);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% univariate data
% time-length
data.tL_f = [ ... % time since birth (yr), std length (cm)
0.249	2.520
0.325	2.868
0.414	2.988
0.501	3.531
0.586	3.396
0.674	3.220
0.755	3.170
0.831	3.433
0.920	3.070
0.997	2.969
1.084	3.343
1.160	3.717
1.253	3.692
1.329	4.032
1.413	4.075
1.498	3.966
1.582	4.221
1.674	4.129
1.747	4.020
1.831	4.360
1.920	4.022
1.992	4.124
2.085	4.007
2.250	3.975
2.414	4.392
2.832	4.524];
data.tL_f(:,1) = 365 * (0 + data.tL_f(:,1));  % convert yr to d
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'standard length', 'female'};  
temp.tL_f = C2K(21);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'JohnHaag1996';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), std length (cm)
0.238	2.664
0.317	3.215
0.417	3.420
0.497	3.794
0.581	3.718
0.672	4.236
0.753	4.051
0.827	3.492
1.000	3.232
1.084	3.741
1.164	3.742
1.252	3.997
1.344	4.117
1.418	3.694
1.585	4.399
1.761	4.579
1.915	4.793
2.007	4.819
2.168	4.609
2.410	4.544
2.739	4.929
3.165	4.976];
data.tL_m(:,1) = 365 * (0 + data.tL_m(:,1));  % convert yr to d
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'standard length', 'male'};  
temp.tL_m = C2K(21);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'JohnHaag1996';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f =  5 * weights.tL_f;
weights.tL_m =  5 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v =  2 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-length from photo: SL = 0.85 * TL';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-weight: Ww in g = 0.00513*(TL in cm)^3.14 ';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3BL6B'; % Cat of Life
metaData.links.id_ITIS = '201995'; % ITIS
metaData.links.id_EoL = '219413'; % Ency of Life
metaData.links.id_Wiki = 'Etheostoma_raneyi'; % Wikipedia
metaData.links.id_ADW = 'Etheostoma_raneyi'; % ADW
metaData.links.id_Taxo = '690869'; % Taxonomicon
metaData.links.id_WoRMS = '1397832'; % WoRMS
metaData.links.id_fishbase = 'Etheostoma-raneyi'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Etheostoma_raneyi}}';  
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
bibkey = 'JohnHaag1996'; type = 'Article'; bib = [ ... 
'author = {Carol E. Johnston and W. R. Haag}, ' ...
'year = {1996}, ' ...
'title = {LIFE HISTORY OF THE {Y}AZOO DARTER ({P}ERCIDAE: \emph{Etheostoma raneyi}), A SPECIES ENDEMIC TO NORTH-CENTRAL {M}ISSISSIPPI}, ' ... 
'journal = {Tulane Studies in Zoology and Botany}, ' ...
'volume = {30}, ' ...
'pages = {47-60}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Etheostoma-raneyi.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
