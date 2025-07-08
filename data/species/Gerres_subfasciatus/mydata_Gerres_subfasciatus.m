function [data, auxData, metaData, txtData, weights] = mydata_Gerres_subfasciatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gerreiformes'; 
metaData.family     = 'Gerreidae';
metaData.species    = 'Gerres_subfasciatus'; 
metaData.species_en = 'Common silver-biddy'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPNW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2023 10 29]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 10 28];

%% set data
% zero-variate data

data.am = 8.5*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(27.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 9;  units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'guess'; 
  comment.Lp = 'based on SL 13.9 cm and F2';
data.Li  = 20;  units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'fishbase';

data.Wwb = 6.54e-5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.5 mm: pi/6*0.05^3'; 
data.Wwp = 12; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01479*Lp^3.05, see F1';
data.Wwi = 137.4; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01479*Li^3.05, see F1';

data.Ri  = 367200/365; units.Ri  = '#/d';label.Ri  = 'max reprod rate';  bibkey.Ri  = 'guess';   
  temp.Ri = C2K(27.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Gerres_oyena';
  
% uni-variate data
% time - length
data.tL_fm = [  ... % time since birth (yr), fork length (cm)
    1 12.18 11.23
    2 12.77 12.39
    3 13.37 12.68
    4 13.85 13.02
    5 13.88 13.37
    6 14.78 13.06
    7 16.00 14.27
    8 16.50 NaN
    9 14.00 NaN
   10 17.70 15.20];
data.tL_fm(:,1) = 365 * (0.9 + data.tL_fm(:,1)); % convert yr to d
data.tL_fm(:,2) = data.tL_fm(:,2)/ 0.86; % convert FL to TL
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm    = C2K(27.5);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
treat.tL_fm = {1, {'female','male'}};
bibkey.tL_fm = 'Gray2019';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'weight-length relationship: W in g = 0.01479*(SL in cm)^3.05';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: SL = 0.86*TL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6KGBB'; % Cat of Life
metaData.links.id_ITIS = '645467'; % ITIS
metaData.links.id_EoL = '46580911'; % Ency of Life
metaData.links.id_Wiki = 'Gerres_subfasciatus'; % Wikipedia
metaData.links.id_ADW = 'Gerres_subfasciatus'; % ADW
metaData.links.id_Taxo = '174901'; % Taxonomicon
metaData.links.id_WoRMS = '276969'; % WoRMS
metaData.links.id_fishbase = 'Gerres-subfasciatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gerres_subfasciatus}}';
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
bibkey = 'Gray2019'; type = 'Article'; bib = [ ... 
'doi = {10.1111/jai.13903}, ' ...
'author = {Charles A. Gray}, ' ... 
'year = {2019}, ' ...
'title = {Age determination, growth and mortality of \emph{Gerres subfasciatus} {C}uvier, 1830 in southeast {A}ustralia}, ' ...
'journal = {J Appl Ichthyol.}, ' ...
'volume = {35}, ' ...
'pages = {729–737}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Gerres-subfasciatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

