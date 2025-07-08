  function [data, auxData, metaData, txtData, weights] = mydata_Cichla_monoculus
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cichliformes'; 
metaData.family     = 'Cichlidae';
metaData.species    = 'Cichla_monoculus'; 
metaData.species_en = 'Peacock cichlid'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fnfm'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 10 16];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 16];

%% set data
% zero-variate data
data.ab = 2.5+5.6; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'JepsWine1999';   
  temp.ab = C2K(26.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'yolk sace absorption 5-6 d after hatch'; 
data.am = 8*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'JepsWine1999';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 32;     units.Lp = 'cm';   label.Lp = 'total length at puberty for females';bibkey.Lp = 'guess';
data.Li = 70;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 4.2e-3;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 2 mm of Gymnogeophagus_lacustris: pi/6*0.2^3';
data.Wwp = 474;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on 0.01259*Lp^3.04, see F1';
data.Wwi = 5118;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01259*Li^3.04, see F1; max published weight 9.0 kg';

data.Ri = 3100/365; units.Ri = '#/d';  label.Ri = 'max reproduction rate';   bibkey.Ri = 'fishbase';
  temp.Ri = C2K(26.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), std length (cm)
32.593	23.945
60.403	25.138
90.823	27.431
121.593	28.349
151.989	29.083
180.512	28.349
212.405	30.092
245.019	30.367
274.297	30.642
304.332	32.018
335.462	32.202
367.336	32.569
365+34.220	33.670
365+61.648	34.128
365+91.680	35.229
365+152.837	36.239
365+182.112	36.330
365+212.879	37.064
365+334.828	39.450
365+366.698	39.541
730+33.939	39.725
730+121.763	39.817
730+153.657	41.560
730+182.931	41.560
730+304.501	43.394
730+334.519	43.578
730+366.023	44.037];
data.tL(:,1) = data.tL(:,1) + 630; % set origin at birth
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'std length'};  
  temp.tL = C2K(26.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'CampFrei2010';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.v = weights.psd.v * 10;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01259*(TL in cm)^3.04'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'V7QT'; % Cat of Life
metaData.links.id_ITIS = '648358'; % ITIS
metaData.links.id_EoL = '265044'; % Ency of Life
metaData.links.id_Wiki = 'Cichla_monoculus'; % Wikipedia
metaData.links.id_ADW = 'Cichla_monoculus'; % ADW
metaData.links.id_Taxo = '171189'; % Taxonomicon
metaData.links.id_WoRMS = '1014783'; % WoRMS
metaData.links.id_fishbase = 'Cichla-monoculus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Cichla_monoculus}}';  
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
bibkey = 'CampFrei2010'; type = 'Article'; bib = [ ...
'author = {Campos, C.P. and Freitas, C.E.C.}, ' ...
'year = {2010}, ' ...
'title = {CURVA DE CRESCIMENTO DO TUCUNAR\''{e} \emph{Cichla monoculus} {S}pix \& {A}gassiz, 1831 DO {L}AGO {G}RANDE DE {M}ANACAPURU, {A}MAZONAS, {B}RASIL}, ' ... 
'journal = {Rev. Bras. Eng. Pesca}, ' ...
'volume = {5(1)}, '...
'pages = {1-9}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Cichla-monoculus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

