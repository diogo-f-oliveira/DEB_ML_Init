  function [data, auxData, metaData, txtData, weights] = mydata_Campostoma_anomalum
%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Campostoma_anomalum'; 
metaData.species_en = 'Central stoneroller'; 

metaData.ecoCode.climate = {'Cfa','Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0jFr', 'jpFc'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biHa'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 08 09];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 08 09]; 

%% set data
% zero-variate data
data.am = 4*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'Wiki';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 6.5;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase'; 
data.Li = 28.7;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 4.2e-3;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 2 mm: pi/6*0.2^3';
data.Wwp = 2.85;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00525*Lp^3.13, see F1';
data.Wwi = 297;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00813*Li^3.13, see F1';

data.Ri  = 4800/365; units.Ri  = '#/d';label.Ri  = 'max reprod rate';    bibkey.Ri  = 'fishesoftexas';   
  temp.Ri = C2K(20); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
data.tL = [ ... % time since hatch (d), standard length (cm)
    1  5.6
    2 10.4
    3 13.2
    4 20.6
    5 23.9
    6 22.6];
data.tL(:,1) = 365 * (-.5 + data.tL(:,1));
data.tL(:,2) = data.tL(:,2)/0.84; % convert SL to TL
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature'; 
bibkey.tL = {'fishesoftexas'};

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 10;
weights.Li = weights.Li * 3;
weights.Wwi = weights.Wwi * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = weights.psd.v * 2;
weights.psd.p_M = weights.psd.p_M * 2;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to to differ from females';
D2 = 'mean temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'length-weight for Exoglossum: Ww in g = 0.00813*(TL in cm)^3.13'; 
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length from photo: SL = 0.84*TL';
metaData.bibkey.F2 = 'Wiki'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '5WY7J'; % Cat of Life
metaData.links.id_ITIS = '163508'; % ITIS
metaData.links.id_EoL = '994724'; % Ency of Life
metaData.links.id_Wiki = 'Campostoma_anomalum'; % Wikipedia
metaData.links.id_ADW = 'Campostoma_anomalum'; % ADW
metaData.links.id_Taxo = '165307'; % Taxonomicon
metaData.links.id_WoRMS = '1022825'; % WoRMS
metaData.links.id_fishbase = 'Campostoma-anomalum'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Campostoma_anomalum}}';  
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
'howpublished = {\url{https://www.fishbase.se/summary/Campostoma-anomalum.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishesoftexas'; type = 'Misc'; bib = ...
'howpublished = {\url{http://txstate.fishesoftexas.org/campostoma anomalum.htm}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  