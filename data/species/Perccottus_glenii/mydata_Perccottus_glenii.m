function [data, auxData, metaData, txtData, weights] = mydata_Perccottus_glenii

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gobiiformes'; 
metaData.family     = 'Odontobutidae';
metaData.species    = 'Perccottus_glenii'; 
metaData.species_en = 'Amur Sleeper'; 

metaData.ecoCode.climate = {'Dwd','Dfb','Dfc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFl', '0iFr'};
metaData.ecoCode.embryo  = {'Fnfm'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi','biCvf'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2020 08 22];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 03];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 03];

%% set data
% zero-variate data

data.am = 7*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(26);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 6.35; units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
  comment.Lp = 'based on Sl 5.24 cm';
data.Li  = 25; units.Li  = 'cm';  label.Li  = 'ultimate total length for females';    bibkey.Li  = 'fishbase';

data.Wwb = 8.7e-5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'JoanDari2011';
  comment.Wwb = 'based on egg diameter of 1.8 mm : pi/6*0.18^3';
data.Wwp = 2.87;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = {'JoanDari2011','fishbase'};
  comment.Wwp = 'based on 0.00933*Lp^3.10, see F1';
data.Wwi = 201;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00933*Li^3.10, see F1; fishbase gives 250 g';

data.Ri = 23479/365; units.Ri = '#/d';  label.Ri = 'reprod rate at SL 12.9 cm, TL 15.6 cm'; bibkey.Ri = 'JoanDari2011'; 
  temp.Ri = C2K(26); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data

% time-length
data.tL_f = [ ... % yr class (yr), std length (cm)
    1  3.38
    2  5.02 
    3  6.71
    4  8.11
    5  9.47
    6 11.34
    7 12.18];
data.tL_f(:,1) = 365 * (0 + data.tL_f(:,1));
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f   = C2K(26);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'JoanDari2011';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % yr class (yr), std length (cm)
    1  4.12
    2  5.51 
    3  6.75
    4  7.75
    5  8.42
    6 10.66];
data.tL_m(:,1) = 365 * (0 + data.tL_m(:,1));
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m   = C2K(26);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'JoanDari2011';
comment.tL_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00933*(TL in cm)^3.10'; 
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo:SL =0.825*TL'; 
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6V3SC'; % Cat of Life
metaData.links.id_ITIS = '637837'; % ITIS
metaData.links.id_EoL = '345056'; % Ency of Life
metaData.links.id_Wiki = 'Perccottus_glenii'; % Wikipedia
metaData.links.id_ADW = 'Perccottus_glenii'; % ADW
metaData.links.id_Taxo = '183455'; % Taxonomicon
metaData.links.id_WoRMS = '234083'; % WoRMS
metaData.links.id_fishbase = 'Perccottus-glenii'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Perccottus_glenii}}';
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
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Perccottus-glenii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'JoanDari2011'; type = 'article'; bib = [ ... 
'doi = {10.1007/s10750-010-0524-0}, ' ... 
'author = {Grabowska Joanna and Pietraszewski Dariusz  and Przybylski Miros{\l}aw and Tarkan Ali Serhan and Marsza{\l} Lidia and Lampart-Ka{\l}u\v{z}niacka Magdalena}, ' ... 
'year = {2011}, ' ...
'title = {Life-history traits of {A}mur sleeper, \emph{Perccottus glenii}, in the invaded Vistula River: early investment in reproduction but reduced growth rate}, ' ...
'journal = {Hydrobiologia}, ' ...
'volume = {661}, ' ...
'pages = {197-210}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


