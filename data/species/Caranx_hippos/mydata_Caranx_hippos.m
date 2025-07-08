  function [data, auxData, metaData, txtData, weights] = mydata_Caranx_hippos
%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Carangiformes'; 
metaData.family     = 'Carangidae';
metaData.species    = 'Caranx_hippos'; 
metaData.species_en = 'Crevalle jack'; 

metaData.ecoCode.climate = {'MA','MB'};
metaData.ecoCode.ecozone = {'MA'};
metaData.ecoCode.habitat = {'0iMdb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24.8); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 06 17];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 06 17];

%% set data
% zero-variate data
data.ab = 9; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(24.8);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 5*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(24.8);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 66;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase';
data.Li = 124;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 5.23e-4;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 4.8e3;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on (Lp/Li)^3*Wwi: (66/124)^3*32e3';
data.Wwi = 32e3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00275*Li^3.06, see F1, gives 7 kg';

data.Ri  = 2e4/365;   units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'guess';  
  temp.Ri = C2K(24.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Caranx_ignobilis';

% uni-variate data
data.tL = [ ... % time since brth (yr), total length (cm)
    1 28.8
    2 39.0
    3 45.0];
data.tL(:,1) = (data.tL(:,1)+ 0)*365; % convert yr to d
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(24.8);  units.temp.tL = 'K'; label.temp.tL = 'temperature'; 
bibkey.tL = 'DevaKuru1997';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 3;
weights.ab = weights.ab * 0;
weights.Wwi = weights.Wwi * 3;

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
F1 = 'length-weight: Ww in g = 0.00275*(TL in cm)^3.06'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'R2QB'; % Cat of Life
metaData.links.id_ITIS = '168609'; % ITIS
metaData.links.id_EoL = '46577967'; % Ency of Life
metaData.links.id_Wiki = 'Caranx_hippos'; % Wikipedia
metaData.links.id_ADW = 'Caranx_hippos'; % ADW
metaData.links.id_Taxo = '165429'; % Taxonomicon
metaData.links.id_WoRMS = '126803'; % WoRMS
metaData.links.id_fishbase = 'Caranx-hippos'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Caranx_hippos}}';  
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
bibkey = 'DevaKuru1997'; type = 'techreport'; bib = [ ... 
'howpublished = {\url{https://core.ac.uk/download/pdf/33017552.pdf}}, ' ...
'author = {Devaraj, M. and K.N. Kurup and N.G.K. Pillai and K. Bala and E. Vivekanandan and R. Sathiadhas}, ' ...
'year = {1997}, ' ...
'title = {Status, prospects and management of small pelagic fisheries in {I}ndia}, ' ... 
'journal = {RAP Publication: Bangkok, Thailand}, ' ...
'volume = {31}, '...
'pages = {191-198}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Caranx_hippos.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  