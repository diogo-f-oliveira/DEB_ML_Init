function [data, auxData, metaData, txtData, weights] = mydata_Galatea_paradoxa

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Cardiida'; 
metaData.family     = 'Donacidae';
metaData.species    = 'Galatea_paradoxa'; 
metaData.species_en = 'Donax clam'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFm', '0iMm'};
metaData.ecoCode.embryo  = {'Mp','Fp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPp', 'jiD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab';  'am';  'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'R_i'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2021 02 10];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 02 10]; 


%% set data
% zero-variate data

data.ab = 2;    units.ab = 'd';    label.ab = 'age at birth';                  bibkey.ab = 'guess';   
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 15*365; units.am = 'd';    label.am = 'life span';                     bibkey.am = 'KingAzag2017';   
  temp.am = C2K(25);   units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 3.6;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';      bibkey.Lp  = 'guess';
data.Li  = 11.4; units.Li  = 'cm';  label.Li  = 'ultimate total length';        bibkey.Li  = 'KingAzag2017';

data.Wwb = 4e-6;    units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 200 mum: pi/6*0.02^3';
data.Wwi = 344.8;     units.Wwi = 'g';  label.Wwi = 'tissue wet weight at SL 9.74 cm';  bibkey.Wwi = 'KingAzag2017';

data.Ri = 1e5/365; units.Ri  = '#/d';   label.Ri  = 'max reprod rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.95';
 
% uni-variate data
% t-L data
data.tL = [ ... % year class (yr), shell length (cm)
    5 5.101
    6 5.442
    7 6.078
    8 6.630
    9 6.789
   10 7.309
   11 7.826
   12 7.834
   13 8.635
   14 8.240
   15 8.296];
data.tL(:,1) = (.5 + data.tL(:,1)) * 365; % convert yr class to time since birth (d)
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell length'};  
temp.tL    = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'KingAzag2017';
comment.tL = 'Data from Apoi Creek, Nigeria';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 20 * weights.tL;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.3; weights.psd.k = 1; units.psd.k = ''; label.psd.k = 'maintenance ratio';

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '6K7RZ'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46474637'; % Ency of Life
metaData.links.id_Wiki = 'Galatea'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '5397328'; % Taxonomicon
metaData.links.id_WoRMS = '494749'; % WoRMS
metaData.links.id_molluscabase = '494749'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Donax_trunculus}}';
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
bibkey = 'KingAzag2017'; type = 'Article'; bib = [ ... 
'author = {T. Kingdom and S. Azagba}, ' ... 
'year = {2017}, ' ...
'title = {Age and growth of the freshwater clam \emph{Galatea Paradoxa} ({B}orn 1778) from {A}poi {C}reek, {N}iger {D}elta, {N}igeria}, ' ...
'journal = {Archiva Zootechnica}, ' ...
'volume = {20(2)}, ' ...
'pages = {105-115}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


