function [data, auxData, metaData, txtData, weights] = mydata_Umbrina_canariensis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Sciaeniformes'; 
metaData.family     = 'Sciaenidae';
metaData.species    = 'Umbrina_canariensis'; 
metaData.species_en = 'Canary drum'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(14.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author         = {'Bas Kooijman'};    
metaData.date_subm      = [2018 12 30];              
metaData.email          = {'bas.kooijman@vu.nl'};            
metaData.address        = {'VU University Amsterdam'};   

metaData.curator        = {'Starrlight Augustine'};
metaData.email_cur      = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc       = [2018 12 30];

%% set data
% zero-variate data


data.am = 27*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'HutcGrif2006';   
  temp.am = C2K(14.5); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 23;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';bibkey.Lp  = 'HutcGrif2006'; 
 comment.Lp = '22 cm for male';
data.Li  = 80;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 164;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'fishbase','HutcGrif2006'};
  comment.Wwp = 'based on 0.00871*Li^3.14, see F1';
data.Wwi = 8.25e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00871*Li^3.14, see F1';

data.Ri = 2.2e6/365;  units.Ri = '#/d';  label.Ri = 'reprod rate';  bibkey.Ri = 'guess';
  temp.Ri = C2K(27); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on kap = 0.86';
 
% uni-variate data
% t-L data
data.tL = [ ... % yr class (yr), total length (mm)
    1 172
    2 189
    3 243
    4 277
    5 284
    6 288
    7 296
    8 311
    9 326
   10 336
   11 330
   12 344
   13 350
   14 345
   15 346
   16 342
   17 336
   18 351
   19 420
   20 324
   21 364
   22 326
   23 340
   24 338
   25 366
   26 381
   27 383];
data.tL(:,1) = (.75 + data.tL(:,1)) * 365; % convert yr to d
data.tL(:,2) = data.tL(:,2)/10; % convert mm to cm
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(14.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'HutcGrif2006';
comment.tL = 'Data from Algoa Bay, sexes combined';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'weight-length relationship: Ww in g  = 0.00871*(TL in cm)^3.14';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Marine; brackish; demersal. Tropical';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '7DGKN'; % Cat of Life
metaData.links.id_ITIS = '169306'; % ITIS
metaData.links.id_EoL = '46578942'; % Ency of Life
metaData.links.id_Wiki = 'Umbrina_canariensis'; % Wikipedia
metaData.links.id_ADW = 'Umbrina_canariensis'; % ADW
metaData.links.id_Taxo = '189713'; % Taxonomicon
metaData.links.id_WoRMS = '127011'; % WoRMS
metaData.links.id_fishbase = 'Umbrina-canariensis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Umbrina_canariensis}}';
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
bibkey = 'HutcGrif2006'; type = 'Article'; bib = [ ... 
'author = {Kenneth Hutchings and Marc H. Griffiths and John G. Field}, ' ... 
'year = {2006}, ' ...
'title = {Regional variation in the life history of the canary drum \emph{Umbrina canariensis} ({S}ciaenidae), in {S}outh {A}frican waters}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {77}, ' ...
'pages = {312-325}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Umbrina-canariensis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

