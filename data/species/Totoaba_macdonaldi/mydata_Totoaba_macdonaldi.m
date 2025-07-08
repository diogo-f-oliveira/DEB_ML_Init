function [data, auxData, metaData, txtData, weights] = mydata_Totoaba_macdonaldi
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Sciaeniformes'; 
metaData.family     = 'Sciaenidae';
metaData.species    = 'Totoaba_macdonaldi'; 
metaData.species_en = 'Totoaba'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2020 07 19];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 07 19]; 

%% set data
% zero-variate data

data.tp = 6.5*365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = {'CisnMont1995','fishbase'};
  temp.tp = C2K(20); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 24*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'fishbase';   
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 103;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty';bibkey.Lp  = 'CisnMont1995'; 
data.Li  = 200;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 1.1e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at puberty';  bibkey.Wwb = 'CisnMont1995';
  comment.Wwb = 'based on egg diameter og 0.6 mm (> 0.5 mm is mature): pi/6*0.06^3';
data.Wwp = 13.5e3;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';  bibkey.Wwp = {'fishbase','CisnMont1995'};
  comment.Wwp = 'based on 0.00891*Lp^3.07, see F1';
data.Wwi = 103e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00891*Li^3.07, see F1';

data.Ri = 61067*103/365;   units.Ri = '#/d';  label.Ri = 'max reproduction rate';  bibkey.Ri = 'CisnMont1995';   
  temp.Ri = C2K(20); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on 61067 eggs per kg';
 
% uni-variate data
% time - length
data.tL = [ ... % time since birth (d), total length (cm)
     0.25   7.6
     0.75  26.7
     1.50  58.4
     2.50  71.1
     3.50 100.0
     4.50  90.5
     5.50  97.6
     6.50  88.5
     7.50 126.2
     8.50 131.8
     9.50 143.9
    10.50 141.1
    11.50 126.3
    12.50 138.0
    13.50 149.9
    14.50 143.1
    15.50 142.3
    16.50 162.3
    17.50 160.8
    18.50 193.0
    19.50 154.0];
data.tL(:,1) = data.tL(:,1)*365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'CisnMont1995';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = '';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: W in g = 0.00891*(TL in cm)^3.07';
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length from photo: SL=0.74*TL';
metaData.bibkey.F2 = 'Wiki';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '7CK9G'; % Cat of Life
metaData.links.id_ITIS = '646540'; % ITIS
metaData.links.id_EoL = '46579249'; % Ency of Life
metaData.links.id_Wiki = 'Totoaba_macdonaldi'; % Wikipedia
metaData.links.id_ADW = 'Totoaba_macdonaldi'; % ADW
metaData.links.id_Taxo = '189177'; % Taxonomicon
metaData.links.id_WoRMS = '283019'; % WoRMS
metaData.links.id_fishbase = 'Totoaba-macdonaldi'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Totoaba_macdonaldi}}';
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
bibkey = 'CisnMont1995'; type = 'Article'; bib = [ ... 
'author = {Miguel A. Cisneros-Mata and Gabriela Montemayor-L\''{o}pez and Martha J. Rom\''{a}-Rodr\''{i}guez}, ' ... 
'year = {1995}, ' ...
'title = {Life History and Conservation of \emph{Totoaba macdonaldi} }, ' ...
'journal = {Conservation Biology}, ' ...
'volume = {9}, ' ...
'pages = {806-814}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Totoaba-macdonaldi.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

