  function [data, auxData, metaData, txtData, weights] = mydata_Semotilus_corporalis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Semotilus_corporalis'; 
metaData.species_en = 'Fallfish'; 

metaData.ecoCode.climate = {'Dfb','Dfc'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFc','0iFr'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2020 09 24];                           
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
data.am = 10*365;   units.am = 'd';  label.am = 'life span';                 bibkey.am = 'Reed1971';   
  temp.am = C2K(13); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 15;  units.Lp = 'cm'; label.Lp = 'total length at puberty';      bibkey.Lp = 'Reed1971'; 
  comment.Lp = 'based on tp 4 yr and tL data';
data.Lpm = 13;  units.Lpm = 'cm'; label.Lpm = 'total length at puberty for males';  bibkey.Lpm = 'Reed1971'; 
  comment.Lpm = 'based on tp 3 yr and tL data';
data.Li = 51;    units.Li = 'cm'; label.Li = 'ultimate total length';      bibkey.Li = 'fishbase';

data.Wwb = 5.3e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Reed1971';
  comment.Wwb = 'based on egg diameter of 2.16 mm: pi/6*0.216^3';
data.Wwi = 1.94e3; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'fishbase';
   comment.Wwi = 'based on 0.00912*Li^3.12 (see F1)';

data.Ri = 12321/365;   units.Ri = '#/d';  label.Ri = 'max reproduction rate'; bibkey.Ri = 'fishbase';
  temp.Ri = C2K(18); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data
% time-length
data.tL_f = [ ... % time (yr), total length (cm)
    1  4.4
    2  6.7
    3 13.1
    4 15.2
    5 18.0
    6 21.2];
data.tL_f(:,1) = 365 * (0 + data.tL_f(:,1));  % convert mnth to d
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(13);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Reed1971';
comment.tL_f = 'Data for females from Mill River, Massachusetts';
%
data.tL_m = [ ... % time (yr), total length (cm)
    1  4.3
    2  6.8
    3 12.3
    4 17.0
    5 21.0
    6 24.0];
data.tL_m(:,1) = 365 * (0 + data.tL_m(:,1));  % convert mnth to d
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(13);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Reed1971';
comment.tL_m = 'Data for males from Mill River, Massachusetts';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f =  5 * weights.tL_f;
weights.tL_m =  5 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v =  2 * weights.psd.v;
weights.psd.p_M =  3 * weights.psd.p_M;

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
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00912 * (TL in cm)^3.12';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: SL = 0.83 * TL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '4WHNY'; % Cat of Life
metaData.links.id_ITIS = '163375'; % ITIS
metaData.links.id_EoL = '205328'; % Ency of Life
metaData.links.id_Wiki = 'Semotilus_corporalis'; % Wikipedia
metaData.links.id_ADW = 'Semotilus_corporalis'; % ADW
metaData.links.id_Taxo = '187402'; % Taxonomicon
metaData.links.id_WoRMS = '1026490'; % WoRMS
metaData.links.id_fishbase = 'Semotilus-corporalis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Semotilus_corporalis}}';  
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
bibkey = 'Reed1971'; type = 'article'; bib = [ ... 
'doi = {10.1577/1548-8659(1971)100<717:BOTFSC>2.0.CO;2}, ' ...
'author = {Roger J. Reed}, ' ...
'year = {1971}, ' ...
'title = {Biology of the Fallfish, \emph{Semotilus corporalis} ({P}isces, {C}yprinidae)}, ' ... 
'journal = {Transactions of the American Fisheries Society}, ' ...
'volume = {100(4)}, '...
'pages = {717-725}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Semotilus-corporalis}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
