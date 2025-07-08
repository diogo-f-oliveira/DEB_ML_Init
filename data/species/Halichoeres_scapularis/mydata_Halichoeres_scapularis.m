function [data, auxData, metaData, txtData, weights] = mydata_Halichoeres_scapularis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Labriformes'; 
metaData.family     = 'Labridae';
metaData.species    = 'Halichoeres_scapularis'; 
metaData.species_en = 'Zigzag wrasse'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MP','MI'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.6); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 1.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 11 28];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 11 28];

%% set data
% zero-variate data

data.ab = 3.6;     units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(28.6); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 8*365;    units.am = 'd';    label.am = 'life span';            bibkey.am = 'guess';   
  temp.am = C2K(28.6); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Centrolabrus exoletus';
  
data.Lp  = 7;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 20;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 4.6;   units.Wwp = 'g';   label.Wwp = 'ultimate wet weight';  bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.01000*Lp^3.15, see F1';
data.Wwi = 125.4;   units.Wwi = 'g';   label.Wwi = 'wet weight at puberty';  bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01000*Li^3.15, see F1';

data.GSI = 0.1; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'guess';
  temp.GSI = C2K(28.6); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Centrolabrus exoletus';
  
% univariate data
% time-length
data.tL = [ ... % time since birht (d), std length (cm)
13.957	6.666
74.438	8.502
104.467	8.749
135.765	9.474
227.543	12.322
288.024	12.626
318.899	12.394
349.774	13.215
365+15.649	13.462
365+74.015	14.726
365+105.736	14.780
365+227.543	17.205];
data.tL(:,1) = data.tL(:,1) + 150; % set origin at birth
units.tL = {'d', 'cm'};     label.tL = {'time since birth', 'std length'};  
temp.tL = C2K(28.6);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Murt2002';

%% set weights for all real data
weights = setweights(data, []);
weights.ab = 0 * weights.ab;
weights.tL = 5 * weights.tL;
weights.Wwb = 3 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are supposed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length weight: Ww in g = 0.01000*(TL in cm)^3.15';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6KXGC'; % Cat of Life
metaData.links.id_ITIS = '170531'; % ITIS
metaData.links.id_EoL = '46571746'; % Ency of Life
metaData.links.id_Wiki = 'Halichoeres_scapularis'; % Wikipedia
metaData.links.id_ADW = 'Halichoeres_scapularis'; % ADW
metaData.links.id_Taxo = '175829'; % Taxonomicon
metaData.links.id_WoRMS = '218990'; % WoRMS
metaData.links.id_fishbase = 'Halichoeres-scapularis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Halichoeres_scapularis}}';
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
bibkey = 'Murt2002'; type = 'techreport'; bib = [ ... 
'author = {Murty, V.S.}, ' ... 
'year = {2002}, ' ...
'title = {Marine ornamental fish resources of Lakshadweep}, ' ...
'institution = {CMFRI Spec. Publ.}, ' ...
'volume = {72}, ' ...
'pages = {1-384}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Halichoeres-scapularis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

