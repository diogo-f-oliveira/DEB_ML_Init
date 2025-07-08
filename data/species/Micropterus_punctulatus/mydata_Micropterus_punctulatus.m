function [data, auxData, metaData, txtData, weights] = mydata_Micropterus_punctulatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Centrarchiformes'; 
metaData.family     = 'Centrarchidae';
metaData.species    = 'Micropterus_punctulatus'; 
metaData.species_en = 'Spotted bass'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFl', '0iFp'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm = [2020 08 08];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 08 08];

%% set data
% zero-variate data

data.am = 11*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishesoftexas';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 24.9;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishesoftexas'; 
data.Li  = 63.5;    units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwb = 5.23e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'fishesoftexas';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 218;     units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'fishesoftexas','fishbase'};
  comment.Wwi = 'based on 0.01202*Lp^3.05, see F1';
data.Wwi = 3.8e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01202*Li^3.05, see F1; fishbase gives 4.7 kg';
 
data.Ri = 30586/365;   units.Ri = 'g';  label.Ri = 'Reprod rate at TL 44.4 cm'; bibkey.Ri = 'fishesoftexas';
  temp.Ri = C2K(25); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% t-L data
data.tL = [ ... % time since hatch (yr), total length (cm)
    1 16.0
    2 28.0
    3 34.5
    4 39.0];
data.tL(:,1) = (-.3 + data.tL(:,1)) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'fishesoftexas';


%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'length-weight: Ww in g = 0.01202*(TL in cm)^3.05'; 
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4353F'; % Cat of Life
metaData.links.id_ITIS = '168161'; % ITIS
metaData.links.id_EoL = '205773'; % Ency of Life
metaData.links.id_Wiki = 'Micropterus_punctulatus'; % Wikipedia
metaData.links.id_ADW = 'Micropterus_punctulatus'; % ADW
metaData.links.id_Taxo = '180099'; % Taxonomicon
metaData.links.id_WoRMS = '1030583'; % WoRMS
metaData.links.id_fishbase = 'Micropterus-punctulatus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Micropterus_punctulatus}}';
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
'howpublished = {\url{http://www.fishbase.org/summary/Micropterus-punctulatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishesoftexas'; type = 'Misc'; bib = ...
'howpublished = {\url{http://txstate.fishesoftexas.org/micropterus punctulatus.htm}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

