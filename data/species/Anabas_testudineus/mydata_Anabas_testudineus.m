function [data, auxData, metaData, txtData, weights] = mydata_Anabas_testudineus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Anabantiformes'; 
metaData.family     = 'Anabantidae';
metaData.species    = 'Anabas_testudineus'; 
metaData.species_en = 'Climbing perch'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iFr', '0iFl', '0iFp'};
metaData.ecoCode.embryo  = {'Fc', 'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi', 'piCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L';'t-Ww'}; 

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

data.ab = 3; units.ab = 'd';  label.ab = 'age at birth';                bibkey.ab = 'KariIsla2012';   
  temp.ab = C2K(28); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
  comment.ab = '18.5 h till hatch, start feeding 48-60 h post hatch';
data.am = 10 * 365; units.am = 'd';  label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(28); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 12;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess';
data.Li  = 25;   units.Li  = 'cm';   label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwb = 1.8e-4; units.Wwb = 'g';    label.Wwb = 'wet weight at puberty';     bibkey.Wwb = 'KariIsla2012';
  comment.Wwb = 'based on egg diameter of 0.7 mm: pi/6*0.07^3';
data.Wwp = 35.6; units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'guess';
  comment.Wwp = 'based on 0.02455*Lp^2.93, see F1';
data.Wwi = 306; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.02455*Li^2.93, see F1';
 
data.Ri = 86108/365;   units.Ri = '#/d';  label.Ri = 'max reproduction rate';   bibkey.Ri = 'fishbase';
  temp.Ri = C2K(28); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time - length - weight
data.tLW = [ ... % time  (d), total length (cm), wet weight (g)
    1  1.40  1.50
   15  4.11  4.47
   30  5.52  7.92
   45  8.32 20.01
   60  9.38 35.30
   75 10.51 46.02
   90 11.55 54.29
  105 12.75 59.73];
units.tLW   = {'d', 'cm', 'g'};  label.tLW = {'time', 'total length', 'weight'};  
temp.tLW    = C2K(28.45);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'AdhiMost2009'; treat.tLW = {1, {'total length','weight'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 5 * weights.tLW;
weights.Wwb = 3 * weights.Wwb;
weights.Wwp = 0 * weights.Wwp;
weights.Wwi = 0 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Wwi and Wwp ignored due to inconsistency with tL and tW data';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.02455*(TL in cm)^2.93';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '66GQ9'; % Cat of Life
metaData.links.id_ITIS = '172585'; % ITIS
metaData.links.id_EoL = '46577514'; % Ency of Life
metaData.links.id_Wiki = 'Anabas_testudineus'; % Wikipedia
metaData.links.id_ADW = 'Anabas_testudineus'; % ADW
metaData.links.id_Taxo = '46787'; % Taxonomicon
metaData.links.id_WoRMS = '279597'; % WoRMS
metaData.links.id_fishbase = 'Anabas-testudineus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Anabas_testudineus}}';
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
bibkey = 'AdhiMost2009'; type = 'Article'; bib = [ ... 
'author = {Ripon Kumar Adhikary and Zubaer Bin Mostafa and Atal Saha and Dr. Md. Saifuddin Shah}, ' ... 
'year = {2009}, ' ...
'title = {GROWTH PERFORMANCE OF {T}HAI KOI (\emph{Anabas testudineus}) IN INTEGRATED CULTURE SYSTEM}, ' ...
'journal = {Bangladesh Research Punblications Journal}, ' ...
'volume = {2(1)}, ' ...
'pages = {361-370}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KariIsla2012'; type = 'Article'; bib = [ ... 
'author = {Md. Rezaul Karim and Md. Tariqul Islam and Khanam Taslima and M. Kaniz Fatema and Harunur Rashid}, ' ... 
'year = {2012}, ' ...
'title = {Ontogenic Development of Climbing Perch, \emph{Anabas testudineus}}, ' ...
'journal = {Proceedings of 3rd International Conference on Environmental Aspects of Bangladesh [ICEAB 2012]; October 13~14}, ' ...
'volume = {D 144}, ' ...
'pages = {63-66}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Anabas-testudineus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

