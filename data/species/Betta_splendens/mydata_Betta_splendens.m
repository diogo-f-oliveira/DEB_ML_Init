function [data, auxData, metaData, txtData, weights] = mydata_Betta_splendens

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Anabantiformes'; 
metaData.family     = 'Osphronemidae';
metaData.species    = 'Betta_splendens'; 
metaData.species_en = 'Siamese fighting fish'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iFr', '0iFl', '0iFp'};
metaData.ecoCode.embryo  = {'Fc', 'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi', 'piCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm = [2023 03 12];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2023 03 12];

%% set data
% zero-variate data

data.ab = 2.5; units.ab = 'd';  label.ab = 'age at birth';                bibkey.ab = 'tankarium';   
  temp.ab = C2K(28); units.temp.ab = 'K'; label.temp.am = 'temperature'; 
  comment.ab = '2-3 d';
data.tp = 4*30.5; units.tp = 'd';  label.tp = 'time since birth at puberty';  bibkey.tp = 'Wiki';   
  temp.tp = C2K(28); units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 10 * 365; units.am = 'd';  label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(28); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 4;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess';
data.Li  = 8;   units.Li  = 'cm';   label.Li  = 'ultimate total length';   bibkey.Li  = 'Wiki';

data.Wwb = 5.2e-4; units.Wwb = 'g';    label.Wwb = 'wet weight at puberty';     bibkey.Wwb = 'petfishonline';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 0.6; units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'guess';
  comment.Wwp = 'based on 0.02455*Lp^2.93, see F1';
data.Wwi = 4.7; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00977*Li^2.97, see F1';
 
data.Ri = 390/365;   units.Ri = '#/d';  label.Ri = 'max reproduction rate';   bibkey.Ri = 'fishbase';
  temp.Ri = C2K(28); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time - length
data.tL = [ ... % time since hatch (d), total length (inch)
    1 0.10
    7 0.20
   14 0.25
   21 0.35
   28 0.45
   35 0.60
   42 0.80
   49 1.10
   56 1.30
   63 1.50];
data.tL(:,1) = data.tL(:,1) * 2.54; % convert inch to cm
units.tL   = {'d', 'cm'};  label.tL = {'time since hatch', 'total length'};  
temp.tL    = C2K(28);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'tankarium'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Wwb = 3 * weights.Wwb;
weights.Wwp = 0 * weights.Wwp;
weights.Wwi = 0 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Wwi and Wwp ignored due to inconsistency with tL and tW data';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00977*(TL in cm)^2.99';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Makes bubble nest';
metaData.bibkey.F2 = 'Wiki'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'LP2V'; % Cat of Life
metaData.links.id_ITIS = '172611'; % ITIS
metaData.links.id_EoL = '211488'; % Ency of Life
metaData.links.id_Wiki = 'Betta_splendens'; % Wikipedia
metaData.links.id_ADW = 'Betta_splendens'; % ADW
metaData.links.id_Taxo = '46809'; % Taxonomicon
metaData.links.id_WoRMS = '46809'; % WoRMS
metaData.links.id_fishbase = 'Betta-splendens'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Betta_splendens}}';
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
bibkey = 'tankarium'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.tankarium.com/baby-betta-growth-chart/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'petfishonline'; type = 'Misc'; bib = ...
'howpublished = {\url{https://petfishonline.com/betta-eggs/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Betta-splendens.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

