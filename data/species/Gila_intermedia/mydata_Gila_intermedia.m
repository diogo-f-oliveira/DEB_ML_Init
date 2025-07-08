function [data, auxData, metaData, txtData, weights] = mydata_Gila_intermedia

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Gila_intermedia';
metaData.species_en = 'Gila chub'; 

metaData.ecoCode.climate = {'BSk','Csa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi','biHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Starrlight Augustine'};                             
metaData.date_subm = [2020 06 28];                          
metaData.email     = {'sta@akvaplan.niva.no'};                 
metaData.address   = {'Akvaplan-niva, FRAM, Tromso, Norway'};      

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2020 06 29]; 

%% set data
% zero-variate data

data.ab = 6;   units.ab = 'd';  label.ab = 'age at hatch';  bibkey.ab = 'fws';   
  temp.ab = C2K(22); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
  comment.ab = 'the data is in fact age at hatch, so birth might be a bit later';
data.tp = 1 * 365;   units.tp = 'd';  label.tp = 'time since birth at puberty';  bibkey.tp = 'fws';   
  temp.tp = C2K(13); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp  = 'temp is guessed, youngest mature female was 1 year old ';
data.am = 4 * 365;   units.am = 'd';  label.am = 'life span';                      bibkey.am = 'fws';   
  temp.am = C2K(22.5); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'temp is guessed, source says longevity greater than 4';
  
data.Lb = 6.55/10;  units.Lb = 'cm'; label.Lb = 'standard length at birth'; bibkey.Lb = 'fws';
comment.Lb = 'length at hatch actually';
data.Lp = 9.5;  units.Lp = 'cm'; label.Lp = 'standard length at puberty'; bibkey.Lp = 'fws';
data.Li = 38;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 1.2e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';          bibkey.Wwb = {'Kuce1978','guess'};
  comment.Wwb = 'based on egg diameter of 1.3 mm from G. bicolor, now called Siphateles bicolor : pi/6*0.13^3';
data.Wwi = 716;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';          bibkey.Wwi = {'fishbase', 'guess'};
   comment.Wwi = 'based on 0.00813 * 38^3.13, see discussion ';
   
data.Ri = 5449/365; units.Ri = '#/d';  label.Ri = 'ultimate reprod rate';  bibkey.Ri = 'fws';
  temp.Ri = C2K(13); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'temp is guessed, max value reported in the fws plan used';
    
% % univariate data
 
% time-length
data.tL = [ ... % days post hatch, total length (mm)
1,1,2,2,3,3,4,4,5;
6.5,9,9.8,13.5,13.3,16.0,16.2,18.2,18.6]';
data.tL(:,1) = data.tL(:,1) * 365 ; % convert year to day
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(13);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'fws';
comment.tL = 'table 1.1, both areas combined, temp is guessed'; 

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;


%% Discussion points
D1 = 'TL is 1.167 SL';
  metaData.bibkey.D1 = 'fishbase';
D2 = 'weight length relationship: Ww in g = 0.00813 * (TL in cm)^3.13.';
  metaData.bibkey.D2 = 'fishbase';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Links
metaData.links.id_CoL = '3G2GJ'; % Cat of Life
metaData.links.id_ITIS = '744295'; % ITIS
metaData.links.id_EoL = '211695'; % Ency of Life
metaData.links.id_Wiki = 'Gila_intermedia'; % Wikipedia
metaData.links.id_ADW = 'Gila_intermedia'; % ADW
metaData.links.id_Taxo = '174942'; % Taxonomicon
metaData.links.id_WoRMS = '1019868'; % WoRMS
metaData.links.id_fishbase = 'Gila-intermedia'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Gila_chub}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% % 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Gila-intermedia.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fws'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fws.gov/southwest/es/arizona/Documents/SpeciesDocs/GilaChub/GilaChub_DraftRecoveryPlan_Final_October2014.pdf}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'Kuce1978'; type = 'article'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Paul A. Kucera}, ' ...
'year = {1978}, ' ...
'title  = {REPRODUCTIVE BIOLOGY OF THE TUI CHUB, \emph{Gila bicolor}, IN {P}YRAMID {L}AKE, {N}EVADA}, ' ...
'journal = {The Great Basin Naturalist}, ' ...
'pages = {203--207}, ' ...
'volume = {38}, ' ...
'number = {2}' ];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
