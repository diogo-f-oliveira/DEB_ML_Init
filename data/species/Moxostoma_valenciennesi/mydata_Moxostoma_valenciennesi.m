  function [data, auxData, metaData, txtData, weights] = mydata_Moxostoma_valenciennesi
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Catostomidae';
metaData.species    = 'Moxostoma_valenciennesi'; 
metaData.species_en = 'Greater redhorse'; 

metaData.ecoCode.climate = {'Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(14); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 08 29];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 02];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 02];

%% set data
% zero-variate data
data.am = 15*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'MongDumo1992';   
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 47.5;  units.Lp = 'cm'; label.Lp = 'total length at puberty';  bibkey.Lp = 'MongDumo1992'; 
data.Li = 80;    units.Li = 'cm'; label.Li = 'ultimate total length';           bibkey.Li = 'fishbase';

data.Wwb = 1.9e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'ThomBent2015';
  comment.Wwb = 'based on egg diameter of 1.54 mm of Moxostoma_cervinum: pi/6*0.154^3';
data.Wwp = 773; units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'fishbase','ThomBent2015'};
  comment.Wwp = 'based on 0.00490*Lp^3.10, see F1';
data.Wwi = 3.89e3; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00490*Li^3.10, see F1';

data.Ri = 51430/365;   units.Ri = '#/d';  label.Ri = 'max Reprod rate';    bibkey.Ri = 'MongDumo1992';
  temp.Ri = C2K(14); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data

% time-length
data.tL_f = [ ... % year class (yr), total length (cm)
    1  7.56
    2 14.12
    3 23.33
    4 31.59
    5 37.75
    6 42.91
    7 47.03
    8 50.55
    9 52.83
   10 54.43
   11 55.86
   12 57.28
   13 58.61
   14 59.16
   15 59.40];
data.tL_f(:,1) = 365 * (0 + data.tL_f(:,1));
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(14);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'MongDumo1992';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % year class (yr), total length (cm)
    1  7.56
    2 14.12
    3 23.33
    4 31.59
    5 37.75
    6 42.91
    7 47.03
    8 47.87
    9 50.00
   10 51.41
   11 52.16
   12 53.28
   13 54.74
   14 56.15];
data.tL_m(:,1) = 365 * (0 + data.tL_m(:,1));
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(14);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'MongDumo1992';
comment.tL_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'length-weight: Ww in g = 0.00490 * (TL in cm)^3.10'; 
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: SL = 0.85 * TL'; 
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '73QVK'; % Cat of Life
metaData.links.id_ITIS = '163947'; % ITIS
metaData.links.id_EoL = '207911'; % Ency of Life
metaData.links.id_Wiki = 'Moxostoma_valenciennesi'; % Wikipedia
metaData.links.id_ADW = 'Moxostoma_valenciennesi'; % ADW
metaData.links.id_Taxo = '180420'; % Taxonomicon
metaData.links.id_WoRMS = '1015875'; % WoRMS
metaData.links.id_fishbase = 'Moxostoma-valenciennesi'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Moxostoma_valenciennesi}}';  
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
'howpublished = {\url{https://www.fishbase.se/summary/Moxostoma-valenciennesi.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MongDumo1992'; type = 'Article'; bib = [ ...  
'author = {Jean-Ren\''{e} Mongeau and Pierre Dumont and Louise Cloutier}, ' ...
'year = {1992}, ' ...
'title = {La biologie du suceur cuivr\''{e} (\emph{Moxostoma hubbsi}) compar\''{e}e - celle de quatre autres esp\`{e}ces de Moxostoma (\emph{M. anisurum}, \emph{M. carinatum}, \emph{M. macrolepidotum} et \emph{M. valenciennesi})}, ' ... 
'journal = {Canadian Journal of Zoology}, ' ...
'volume = {70}, '...
'pages = {1354-1364}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ThomBent2015'; type = 'Article'; bib = [ ...  
'author = {Dezarai A. Thompson and John S. Bentley and Steven L. Powers}, ' ...
'year = {2015}, ' ...
'title = {Life-history Aspects of \emph{Moxostoma cervinum} (Blacktip Jumprock) in the {R}oanoke River, {V}irginia}, ' ... 
'journal = {Virginia Journal of Science}, ' ...
'volume = {66(4)}, '...
'pages = {391-401}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

