  function [data, auxData, metaData, txtData, weights] = mydata_Etheostoma_caeruleum
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Percidae';
metaData.species    = 'Etheostoma_caeruleum'; 
metaData.species_en = 'Rainbow darter'; 

metaData.ecoCode.climate = {'Cfa','Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr', '0iFc'};
metaData.ecoCode.embryo  = {'Ft'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 07 03];                           
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
data.tp = 0.5*365;   units.tp = 'd';  label.tp = 'time since birth at puberty';     bibkey.tp = 'GradBart1984';   
  temp.tp = C2K(15); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on Lp and tL data';
data.am = 4.5*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'GradBart1984';   
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 2.8;  units.Lp = 'cm'; label.Lp = 'standard length at puberty';  bibkey.Lp = 'GradBart1984'; 
data.Li = 6.6;    units.Li = 'cm'; label.Li = 'ultimate standard length';  bibkey.Li = 'Wiki';
  comment.Li = 'based on TL 7.6 cm, and from photo: SL=0.87*TL';

data.Wwb = 3.1e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'GradBart1984';
  comment.Wwb = 'based on egg diameter of 1.8 mm: pi/6*0.18^3';
data.Wwi = 3;  units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';   bibkey.Wwi = {'Wiki','fishbase'};
  comment.Wwi = 'based on 0.00513*7.6^3.14, see F1, F2';

data.Ri = 800/365;units.Ri = '#/d'; label.Ri = 'maximum reprod rate';    bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% univariate data
% time-length
data.tL_f = [ ... % time since birth (yr), std length (cm)
0.175	2.291
0.254	2.490
0.349	2.575
0.425	2.659
0.497	2.843
0.586	3.096
0.671	3.020
0.753	3.373
0.838	3.434
0.927	3.488
1.006	3.480
1.098	3.711
1.330	3.772
1.504	3.618
1.599	3.872
1.763	3.933
1.849	3.948
1.931	4.079
2.006	4.048
2.089	4.509
2.173	4.179
2.351	4.156
2.590	4.486
2.754	4.601];
data.tL_f(:,1) = 365 * (0.2 + data.tL_f(:,1));  % convert yr to d
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'standard length', 'female'};  
temp.tL_f = C2K(15);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'GradBart1984';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), std length (cm)
0.343	2.651
0.418	2.789
0.506	2.567
0.592	3.250
0.677	3.181
0.753	3.434
0.838	3.342
0.924	3.388
1.006	3.580
1.094	3.611
1.334	3.641
1.426	3.979
1.517	3.872
1.593	3.995
1.668	3.971
1.757	3.895
1.842	4.140
1.931	4.194
2.006	4.133
2.092	4.678
2.262	4.018
2.344	4.209
2.597	4.424
2.672	4.701
2.843	4.609];
data.tL_m(:,1) = 365 * (0.2 + data.tL_m(:,1));  % convert yr to d
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'standard length', 'male'};  
temp.tL_m = C2K(15);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'GradBart1984';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f =  10 * weights.tL_f;
weights.tL_m =  10 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v =  3 * weights.psd.v;

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
D2 = 'mean temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Facts
F1 = 'length-length from photo: SL = 0.87 * TL';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-weight: Ww in g = 0.00513*(TL in cm)^3.14 ';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3BL2Q'; % Cat of Life
metaData.links.id_ITIS = '168378'; % ITIS
metaData.links.id_EoL = '207232'; % Ency of Life
metaData.links.id_Wiki = 'Etheostoma_caeruleum'; % Wikipedia
metaData.links.id_ADW = 'Etheostoma_caeruleum'; % ADW
metaData.links.id_Taxo = '45182'; % Taxonomicon
metaData.links.id_WoRMS = '1022036'; % WoRMS
metaData.links.id_fishbase = 'Etheostoma-caeruleum'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Etheostoma_caeruleum}}';  
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
bibkey = 'GradBart1984'; type = 'Incollection'; bib = [ ... 
'isbn = {97X-94-009-0550-x}, ' ...
'editor = {David G. Lindquist and Lawrence M. Page}, ' ...
'author = {James M. Grady and Henry L. Bart}, ' ...
'year = {1984}, ' ...
'booktitle = {Environmental biology of darters}, ' ...
'title = {Life history of \emph{Etheostoma caeruleum} ({P}isces: {P}ercidae) in {B}ayou {S}ara, {L}ouisiana and {M}ississippi}, ' ... 
'publisher = {Dr W. Junk Publishers, The Hague}, ' ...
'pages = {71-81}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Etheostoma-caeruleum.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
