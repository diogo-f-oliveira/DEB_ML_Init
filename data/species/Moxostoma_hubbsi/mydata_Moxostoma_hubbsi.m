  function [data, auxData, metaData, txtData, weights] = mydata_Moxostoma_hubbsi
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Catostomidae';
metaData.species    = 'Moxostoma_hubbsi'; 
metaData.species_en = 'Copper redhorse'; 

metaData.ecoCode.climate = {'Cfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(14); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 08 29];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 08 29]; 

%% set data
% zero-variate data
data.am = 22*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'MongDumo1992';   
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 53;  units.Lp = 'cm'; label.Lp = 'total length at puberty';  bibkey.Lp = 'MongDumo1992'; 
  comment.Lp = ' based on tp 10 yr and tL data';
data.Li = 69;    units.Li = 'cm'; label.Li = 'ultimate total length';           bibkey.Li = 'fishbase';

data.Wwb = 1.9e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'ThomBent2015';
  comment.Wwb = 'based on egg diameter of 1.54 mm of Moxostoma_cervinum: pi/6*0.154^3';
data.Wwp = 1.54e3; units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'fishbase','MongDumo1992'};
  comment.Wwp = 'based on 0.01122*Lp^2.98, see F1';
data.Wwi = 3.39e3; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';       bibkey.Wwi = {'fishbase','MongDumo1992'};
  comment.Wwi = 'based on 0.01122*Li^2.98, see F1';

data.Ri = 111860/365;   units.Ri = '#/d';  label.Ri = 'max Reprod rate';    bibkey.Ri = 'MongDumo1992';
  temp.Ri = C2K(14); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data

% time-length
data.tL = [ ... % year class (yr), total length (cm)
    1  6.00
    2 12.66
    3 21.86
    4 30.17
    5 36.99
    6 41.96
    7 46.90
    8 49.31
    9 52.11
   10 54.97
   11 57.20
   12 59.22
   13 61.60
   14 62.66
   15 63.73
   16 65.05
   17 65.87
   18 66.74
   19 67.20
   20 67.01
   21 68.10];
data.tL(:,1) = 365 * (0 + data.tL(:,1));
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(14);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MongDumo1992';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Li = 3 * weights.Li;
weights.Wwb = 3 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.v = 3 * weights.psd.v;
%weights.psd.p_M = 3 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.01122 * (TL in cm)^2.98'; 
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: SL = 0.85 * TL'; 
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '7437M'; % Cat of Life
metaData.links.id_ITIS = '163941'; % ITIS
metaData.links.id_EoL = '207908'; % Ency of Life
metaData.links.id_Wiki = 'Moxostoma_hubbsi'; % Wikipedia
metaData.links.id_ADW = 'Moxostoma_hubbsi'; % ADW
metaData.links.id_Taxo = '180411'; % Taxonomicon
metaData.links.id_WoRMS = '1014131'; % WoRMS
metaData.links.id_fishbase = 'Moxostoma-hubbsi'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Moxostoma_hubbsi}}';  
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
'howpublished = {\url{https://www.fishbase.se/summary/Moxostoma-hubbsi.html}}';  
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

