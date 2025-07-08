function [data, auxData, metaData, txtData, weights] = mydata_Karalla_dussumieri

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Acanthuriformes'; 
metaData.family     = 'Leiognathidae';
metaData.species    = 'Karalla_dussumieri'; 
metaData.species_en = 'Dussumier''s ponyfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPSW','MIN'};
metaData.ecoCode.habitat = {'piMpe', '0jFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.3); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 
metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 22];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 22];

%% set data
% zero-variate data
data.ab = 4.5; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(28.3);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 2.2*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'Kizh2014';   
  temp.am = C2K(28.3);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 8.3;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'JameBadr1981';
data.Li = 16.1;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'JameBadr1981';

data.Wwb = 2.7e-4;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 7.4;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01413*Lp^2.96, see F1';
data.Wwi = 52.8;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01413*Li^2.96, see F1';

data.Ri  = 41683/365; units.Ri  = '#/d';label.Ri  = 'max reprod rate';    bibkey.Ri  = 'JameBadr1981';   
  temp.Ri = C2K(28.3); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
data.tL = [ ... % time since birth (yr), total length (cm)
    0  8.5
    1  9.9
    2 11.4
    3 12.8
    4 13.8
    5 14.5];
data.tL(:,1) = (0.9 + data.tL(:,1)) * 365;
units.tL = {'d', 'cm'};  label.tL = {'time since birth','total length'};  
  temp.tL = C2K(28.3);  units.temp.tL = 'K'; label.temp.tL = 'temperature'; 
bibkey.tL = 'JameBadr1981';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 10;
weights.ab = weights.ab * 0;
weights.Wwb = weights.Wwb * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01413*(TL in cm)^2.96'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3R2KH'; % Cat of Life
metaData.links.id_ITIS = '168805'; % ITIS
metaData.links.id_EoL = '994544'; % Ency of Life
metaData.links.id_Wiki = 'Karalla_dussumieri'; % Wikipedia
metaData.links.id_ADW = 'Karalla_dussumieri'; % ADW
metaData.links.id_Taxo = '3416567'; % Taxonomicon
metaData.links.id_WoRMS = '713339'; % WoRMS
metaData.links.id_fishbase = 'Karalla-dussumieri'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Karalla_dussumieri}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...Photopectoralis-bindus
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'JameBadr1981'; type = 'Article'; bib = [ ... 
'author = {Pauline James and M. Badrudeen}, ' ...
'year = {1981}, ' ...
'title = {BIOLOGY AND FISHERY OF SILVERBELLY \emph{Leiognathus dussumieri} ({V}ALENCIENNES) FROM {G}ULF OF {M}ANNAR}, ' ... 
'journal = {Indian Journal of Fisheries}, ' ...
'volume = {28}, '...
'pages = {154-182}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Karalla-dussumieri.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  