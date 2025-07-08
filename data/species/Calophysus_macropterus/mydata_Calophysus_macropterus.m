  function [data, auxData, metaData, txtData, weights] = mydata_Calophysus_macropterus
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Pimelodidae';
metaData.species    = 'Calophysus_macropterus'; 
metaData.species_en = 'Zamurito'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fnf'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCvf','biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 28];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 28];

%% set data
% zero-variate data
data.ab = 5; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 15*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 27;  units.Lp = 'cm';   label.Lp = 'total length at puberty for females';bibkey.Lp = 'CordLeon2013';
data.Lpm = 24; units.Lpm = 'cm';   label.Lpm = 'total length at puberty for males';bibkey.Lpm = 'CordLeon2013';
data.Li = 40;  units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 2.8e-3;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'AndrMakr2014';
  comment.Wwb = 'based on egg diameter of 1.74 mm of Hemisorubim_platyrhynchos: pi/6*0.174^3';
data.Wwp = 195.7;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'fishbase','CordLeon2013'};
  comment.Wwp = 'based on 0.00692*Lp^3.11, see F1';
data.Wwi = 664.5;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00692*Li^3.11, see F1';

data.GSI = 0.20; units.GSI = 'g/g';  label.GSI = 'gonado somatic index for female';   bibkey.GSI = 'guess';
  temp.GSI = C2K(25);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  
% uni-variate data
% time-length
data.tL_fm = [ ... % time since birth (yr), total length (cm)
    1 21.1 21.7
    2 30.8 31.4
    3 37.2 37.5
    4 41.6 41.5
    5 44.5 44.0
    6 46.4 45.6
    7 47.7 46.6
    8 48.6 47.3];
data.tL_fm(:,1) = (data.tL_fm(:,1) + 0.2) * 365; % convert yr to d
units.tL_fm = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
  temp.tL_fm = C2K(25);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'CordLeon2013'; treat.tL_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = weights.tL_fm * 5;
weights.ab = weights.ab * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.v = weights.psd.v * 10;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00692*(TL in cm)^3.11'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'PZPM'; % Cat of Life
metaData.links.id_ITIS = '681737'; % ITIS
metaData.links.id_EoL = '205854'; % Ency of Life
metaData.links.id_Wiki = 'Calophysus_macropterus'; % Wikipedia
metaData.links.id_ADW = 'Calophysus_macropterus'; % ADW
metaData.links.id_Taxo = '165220'; % Taxonomicon
metaData.links.id_WoRMS = '1022689'; % WoRMS
metaData.links.id_fishbase = 'Calophysus-macropterus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Calophysus_macropterus}}';  
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
bibkey = 'CordLeon2013'; type = 'Article'; bib = [ ...
 'doi = {10.1590/1982-0224-2021-0082}, ' ...
'author = {C\''{e}sar A. Bonilla-Castillo and Edwin Agudelo C\''{o}rdoba and Gladys Vargas and Aurea Garc\''{i}a Vasquez and Guber G\''{o}mez Hurtado and Fabrice Duponchelle}, ' ...
'year = {2022}, ' ...
'title = {Life history trait variations and population dynamics of \emph{Calophysus macropterus} ({S}iluriformes: {P}imelodidae) in two river systems of the {C}olombian and {P}eruvian {A}mazon}, ' ... 
'journal = {Neotropical Ichthyology}, ' ...
'volume = {20(1)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Calophysus-macropterus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

