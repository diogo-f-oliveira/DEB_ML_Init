function [data, auxData, metaData, txtData, weights] = mydata_Scorpaena_elongata
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Scorpaenidae';
metaData.species    = 'Scorpaena_elongata'; 
metaData.species_en = 'Slender rockfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE', 'MAm'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13.9); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 05 21];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 21];

%% set data
% zero-variate data

data.ab = 15;      units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(13.9);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 30*365;     units.am = 'd';    label.am = 'life span';            bibkey.am = 'BilgCeli2009';   
  temp.am = C2K(13.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 32.5;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'RagoGanc2002'; 
data.Li  = 50;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 1.8e-3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 1.5 mm of Scorpaenichthys_marmoratus: pi/6*0.15^3';
data.Wwi = 1.5e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01175*Li^3.01, see F1';
 
data.Ri = 32850/365;     units.Ri = '#/d';    label.Ri = 'max reproduction rate';   bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(13.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length 
data.tL = [ ... %  year class (yr), total length(cm)
    1  8.25
    2 11.33
    3 14.63
    4 17.00
    5 20.13
    6 23.95
    7 26.63
    8 32.71
    9 32.85
   10 32.28
   11 35.79
   12 41.00
   13 47.50
   14 45.30
   15 41.50
   18 49.25
   20 48.33
   21 46.75
   27 53.50
   29 55.00
   30 55.00];
data.tL(:,1) = (data.tL(:,1) + 0.75) * 365; % convert yr to d
units.tL = {'d' 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(13.9); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'RagoGanc2002'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'GrebCail2010 data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01175*(TL in cm)^3.01';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4VWR2'; % Cat of Life
metaData.links.id_ITIS = '166834'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Scorpaena_elongata'; % Wikipedia
metaData.links.id_ADW = 'Scorpaena_elongata'; % ADW
metaData.links.id_Taxo = '187138'; % Taxonomicon
metaData.links.id_WoRMS = '127242'; % WoRMS
metaData.links.id_fishbase = 'Scorpaena-elongata'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Scorpaena_elongata}}';
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
bibkey = 'RagoGanc2002'; type = 'Article'; bib = [ ... 
'author = {S. Ragonese and S. Gancitano and G. Norrito and P. Rizzo and G. Bono}, ' ... 
'year = {2002}, ' ...
'title = {Life history traits of the slender rockfish, \emph{Scorpaena elongata} {C}adenat, 1943 ({P}isces-{S}copaenidae), of the strait of {S}icily ({M}editerranean {S}ea)}, ' ...
'journal = {Biol. Mar. Medit.}, ' ...
'volume = {10(2)}, ' ...
'pages = {223-232}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Scorpaena-elongata.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

