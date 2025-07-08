function [data, auxData, metaData, txtData, weights] = mydata_Ensis_siliqua

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Adapedonta'; 
metaData.family     = 'Solenidae';
metaData.species    = 'Ensis_siliqua'; 
metaData.species_en = 'Pod razor'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 01 21];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 01 21]; 

%% set data
% zero-variate data

data.ab = 5;    units.ab = 'd';       label.ab = 'age at birth';             bibkey.ab = 'Wijs2011';   
  temp.ab = C2K(13);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'Value for Ensis directus';
data.am = 20*365;  units.am = 'd';      label.am = 'life span';                bibkey.am = 'FahyGaff2001';   
  temp.am = C2K(10);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 0.045;  units.Lj  = 'cm';  label.Lj  = 'shell length at metam';   bibkey.Lj  = 'Wijs2011';
  comment.ab = 'Value for Ensis directus';
data.Lp  = 11.2;  units.Lp  = 'cm';  label.Lp  = 'shell length at puberty'; bibkey.Lp  = 'FahyGaff2001';
data.Li  = 21.5;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Wiki';
  
data.Wwb = 3.5e-9;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'Wijs2011';
  comment.Wwb = 'based on egg diameter of 6.7e-3 cm for Ensis directus: pi/6*6.7e-9';
data.Wwi = 110;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';  bibkey.Wwi = 'FahyGaff2001';
  comment.Wwi = 'EoL gives 239 g';

data.GSI  = 0.13; units.GSI  = '-';  label.GSI  = 'gonado somatic index';        bibkey.GSI  = 'CrosRior2014';   
  temp.GSI = C2K(10);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on mean weight of 85 g in Mar-May Jan and 75 g in July-Aug (spent), but values are uncertain';
  
% uni-variate data
% t-L data
data.tL = [ ... % time (yr), length (cm)
    1  3.16
    2  6.35
    3  9.17
    4 11.20
    5 12.65
    6 13.84
    7 14.65
    8 15.25
    9 15.71
   10 16.09
   11 16.38
   12 16.67
   13 16.94
   14 17.24
   15 17.55
   16 17.86
   17 17.72
   18 17.40
   19 17.10];
data.tL(:,1) = data.tL(:,1) * 365 - 200; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell length'};  
temp.tL    = C2K(10);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'FahyGaff2001';
comment.tL = 'mean temperature is based in CrosRior2014';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.3; units.psd.k  = '-';  label.psd.k  = 'maintenance ratio'; weights.psd.k = 0.1;
%weights.psd.v = 10 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Males are slightly larger than females';
metaData.bibkey.F1 = 'FahyGaff2001'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '39X34'; % Cat of Life
metaData.links.id_ITIS = '81026'; % ITIS
metaData.links.id_EoL = '46473367'; % Ency of Life
metaData.links.id_Wiki = 'Ensis_siliqua'; % Wikipedia
metaData.links.id_ADW = 'Ensis_siliqua'; % ADW
metaData.links.id_Taxo = '39470'; % Taxonomicon
metaData.links.id_WoRMS = '140735'; % WoRMS
metaData.links.id_molluscabase = '140735'; % MolluscaBase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ensis_siliqua}}';
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
bibkey = 'FahyGaff2001'; type = 'Article'; bib = [ ... 
'author = {Edward Fahy and Joanne Gaffney}, ' ... 
'year = {2001}, ' ...
'title = {Growth statistics of an exploited razor clam (\emph{Ensis siliqua}) bed at {G}ormanstown, {C}o {M}eath, {I}reland}, ' ...
'journal = {Hydrobiologia}, ' ...
'volume = {465}, ' ...
'pages = {139-151}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CrosRior2014'; type = 'Article'; bib = [ ... 
'author = {M.E. Cross and R.M. O''Riordan and S.C. Culloty}, ' ... 
'year = {2014}, ' ...
'title = {The reproductive biology of the exploited razor clam, Ensis siliqua,in the Irish Sea}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {150}, ' ...
'pages = {11-17}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/46473367}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Wijs2011'; type = 'Techreport'; bib = [ ... 
'author = {Wijsman, J. W. M. }, ' ... 
'year = {2011}, ' ...
'title = {Dynamic Energy Budget parameters for \emph{Ensis directus}.}, ' ...
'institution = {IMARES}, ' ...
'number = {C116/11}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

