function [data, auxData, metaData, txtData, weights] = mydata_Cynoscion_othonopterus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Sciaeniformes'; 
metaData.family     = 'Sciaenidae';
metaData.species    = 'Cynoscion_othonopterus'; 
metaData.species_en = 'Gulf weakfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', '0jMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24.3); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author         = {'Bas Kooijman'};    
metaData.date_subm      = [2019 04 28];              
metaData.email          = {'bas.kooijman@vu.nl'};            
metaData.address        = {'VU University Amsterdam'};   

metaData.curator        = {'Starrlight Augustine'};
metaData.email_cur      = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc       = [2019 04 28];

%% set data
% zero-variate data

data.am = 18*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'fishbase';   
  temp.am = C2K(24.3); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 29.5;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase';
data.Li  = 70;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 2e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'Bort2003';
  comment.Wwb = 'based on egg diameter of 0.72 mm for Cynoscion_nebulosus: pi/6*0.072^3';
data.Wwi = 3.6e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based in 0.00851*Li^3.04, see F1';

data.Ri = 12e6/365;  units.Ri = '#/d';  label.Ri = 'reprod rate';  bibkey.Ri = 'fishbase';
  temp.Ri = C2K(24.3); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
 
% uni-variate data
% time-length data
data.tL = [ ... % yr class (yr), standard length (cm)
    1 16.0
    2 29.5
    3 39.8
    4 48.0
    5 55.0
    6 60.0
    7 64.8
    8 68.9];
data.tL(:,1) = (0 + data.tL(:,1)) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length', 'CRIP'};  
temp.tL    = C2K(24.3);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Arag2014';
comment.tL = 'Data from CRIP (2005)';
%
data.tL1 = [ ... % yr class (yr), total length (cm)
    1 30.7
    2 44.1
    3 53.7
    4 61.5
    5 68.1
    6 72.8
    7 77.9
    8 89.6
    9 88.2];
data.tL1(:,1) = (0.75 + data.tL1(:,1)) * 365; % convert yr to d
units.tL1   = {'d', 'cm'};  label.tL1 = {'time since birth', 'total length', 'Roman-Rodriguez'};  
temp.tL1    = C2K(24.3);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL1 = 'Arag2014';
comment.tL1 = 'Data from Roman-Rodriguez (2000)';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.tL1 = 5 * weights.tL1;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL','tL1'}; subtitle1 = {'Data from CRIP, Roman-Rodriguez'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00851*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6C7N6'; % Cat of Life
metaData.links.id_ITIS = '646725'; % ITIS
metaData.links.id_EoL = '46578988'; % Ency of Life
metaData.links.id_Wiki = 'Cynoscion'; % Wikipedia
metaData.links.id_ADW = 'Cynoscion_othonopterus'; % ADW
metaData.links.id_Taxo = '690720'; % Taxonomicon
metaData.links.id_WoRMS = '276084'; % WoRMS
metaData.links.id_fishbase = 'Cynoscion-othonopterus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cynoscion}}';
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
bibkey = 'Bort2003'; type = 'Book'; bib = [ ...  
'author = {Bortone, S. A.}, ' ...
'year = {2003}, ' ...
'title  = {Biology of the spotted seatrout}, ' ...
'publisher = {CRC Press}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Arag2014'; type = 'Article'; bib = [ ... 
'doi = {10.7773/cm.v40i2.2410}, ' ...
'author = {E Alberto Arag\''{o}n-Noriega}, ' ... 
'year = {2014}, ' ...
'title = {Modeling the individual growth of the Gulf corvina, \emph{Cynoscion othonopterus} ({P}isces: {S}ciaenidae), using a multi-model approach}, ' ...
'journal = {Ciencias Marinas}, ' ...
'volume = {40}, ' ...
'pages = {149-161}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Cynoscion-othonopterus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

