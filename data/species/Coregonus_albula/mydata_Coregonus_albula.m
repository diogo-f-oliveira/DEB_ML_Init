  function [data, auxData, metaData, txtData, weights] = mydata_Coregonus_albula

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Salmoniformes'; 
metaData.family     = 'Salmonidae';
metaData.species    = 'Coregonus_albula'; 
metaData.species_en = 'Vendace'; 

metaData.ecoCode.climate = {'Dfc'};
metaData.ecoCode.ecozone = {'MAb','THp'};
metaData.ecoCode.habitat = {'0jFr', 'jiMpe'};
metaData.ecoCode.embryo  = {'Fg', 'Fs'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L';'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2017 08 19];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 08 19]; 

%% set data
% zero-variate data
data.tp = 2*365;      units.tp = 'd';  label.tp = 'age at puberty';         bibkey.tp = 'fishbase';
  temp.tp = C2K(13); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 10*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'KozoKozo2010';   
  temp.am = C2K(13); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 14.4;    units.Lp = 'cm'; label.Lp = 'total length at puberty for females'; bibkey.Lp = 'KozoKozo2010'; 
  comment.Lp = 'from tL data at tp';
data.Li = 48;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 1.8e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'fishbase';
  comment.Wwb = 'Based on egg diameter of 1.5 mm: 4/3*pi*0.075^3';
data.Wwi = 1000;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
    
data.Ri = 3e4/365; units.Ri = '#/d';  label.Ri = 'max reprod rate';          bibkey.Ri = 'fishbase';
  temp.Ri = C2K(13); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% univariate data

% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
1 10.1
2 14.4
3 17.9
4 20.9
5 24.5
6 27.2];
data.tL(:,1) = 365 * (.5 + data.tL(:,1));
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(13);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'KozoKozo2010';

% length-weight
data.LW = [ ... % lotal length (cm), wet weight (g)
14.8  37.9
15.1  40.8
15.2  42.8
15.5  45.8
15.9  48.2
19.4  83.6
23.2 145.9
25.8 272.1
26.6 256.8
29.8 376.5];
units.LW = {'cm', 'g'}; label.LW = {'total length', 'wet weight'};  
bibkey.LW = 'KozoKozo2010';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = weights.psd.v * 2;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = 'YD7R'; % Cat of Life
metaData.links.id_ITIS = '161963'; % ITIS
metaData.links.id_EoL = '46563164'; % Ency of Life
metaData.links.id_Wiki = 'Coregonus_albula'; % Wikipedia
metaData.links.id_ADW = 'Coregonus_albula'; % ADW
metaData.links.id_Taxo = '42840'; % Taxonomicon
metaData.links.id_WoRMS = '127178'; % WoRMS
metaData.links.id_fishbase = 'Coregonus-albula'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Coregonus_albula}}';  
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
bibkey = 'KozoKozo2010'; type = 'Article'; bib = [ ...  
'author = {K. Kozowski and J. Kozowski and P. Poczyczy\~{n}ski and A. Martyniak}, ' ...
'year = {2010}, ' ...
'title = {Age and growth of vendace, \emph{Coregonus albula} ({L}.), from {L}ake {W}igry (northeast {P}oland)}, ' ... 
'journal = {Arch. Pol. Fish.}, ' ...
'pages = {239--245}, ' ...
'volume = {18}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/231}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

