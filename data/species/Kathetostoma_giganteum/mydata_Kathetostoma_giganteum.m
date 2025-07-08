function [data, auxData, metaData, txtData, weights] = mydata_Kathetostoma_giganteum
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Uranoscopiformes'; 
metaData.family     = 'Uranoscopidae';
metaData.species    = 'Kathetostoma_giganteum'; 
metaData.species_en = 'Giant stargazer'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPSW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(11.2); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 03 03];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 03];

%% set data
% zero-variate data

data.am = 20*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(11.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 47.5;  units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 90;  units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'fishbase';

data.Wwb = 6.4e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Robe1975';
  comment.Wwb = 'based egg diameter of 2.3 mm: pi/6*0.23^3'; 
data.Wwp = 1.93e3; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.0167*Lp^3.02, see F1';
data.Wwi = 13.3e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.0167*Li^3.02, see F1';

data.Ri = 517e3/365;units.Ri = '#/d'; label.Ri = 'maximum reprod rate';    bibkey.Ri = 'guess';   
  temp.Ri = C2K(11.2);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on weight-spec fecundity of Uranoscopus_scaber corrected for max weight and egg weight';

% uni-variate data
% time-length
data.tL_fm = [  ... % time since birth (yr), total length (cm)
    0 16.55 17.10
    1 24.65 23.55
    2 30.73 29.51
    3 36.02 35.74
    4 41.74 39.31
    5 47.20 44.90
    6 54.15 48.32
    7 58.53 51.04
    8 59.70 54.99
    9 63.80 57.15
   10 65.23 58.02
   11 66.75 61.19
   12 70.80 61.33
   13 70.03 60.30
   14 71.05 64.80
   15 72.79 64.63
   16 74.58 64.50
   17 73.50 67.67
   18 72.57 68.50
   19 73.50 NaN
   25 74.00 NaN];
data.tL_fm(:,1) = 365 * (1.9 + data.tL_fm(:,1)); % convert yr to d
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm    = C2K(11.2);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'MannSutt2004'; treat.tL_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;
weights.Wwb = 3 * weights.Wwb;
weights.Wwi = 3 * weights.Wwi;
weights.Ri = 3 * weights.Ri;

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
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'weight-length relationship: W in g = 0.0167*(TL in cm)^3.02';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3R3SB'; % Cat of Life
metaData.links.id_ITIS = '171064'; % ITIS
metaData.links.id_EoL = '46573224'; % Ency of Life
metaData.links.id_Wiki = 'Kathetostoma_giganteum'; % Wikipedia
metaData.links.id_ADW = 'Kathetostoma_giganteum'; % ADW
metaData.links.id_Taxo = '177724'; % Taxonomicon
metaData.links.id_WoRMS = '275992'; % WoRMS
metaData.links.id_fishbase = 'Kathetostoma-giganteum'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Kathetostoma_giganteum}}';
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
bibkey = 'MannSutt2004'; type = 'techreport'; bib = [ ... 
'author = {M. J. Manning and C. P. Sutton}, ' ... 
'year = {2004}, ' ...
'title = {Age and growth of giant stargazer, \emph{Kathetostoma giganteurn},  from the west coast of the {S}outh {I}sland (STA 7)}, ' ...
'institution = {New Zealand Fisheries Assessment}, ' ...
'volume = {report 2004/17}, ' ...
'pages = {1-60}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Robe1975'; type = 'techreport'; bib = [ ... 
'author = {D.A. Robertson}, ' ... 
'year = {1975}, ' ...
'title = {A key to the planktonic eggs of some New Zealand marine teleosts}, ' ...
'institution = {Fisheries Research Division}, ' ...
'volume = {Occasional Publication 9}, ' ...
'pages = {1-20}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Kathetostoma-giganteum.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

