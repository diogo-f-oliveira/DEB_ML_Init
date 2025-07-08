function [data, auxData, metaData, txtData, weights] = mydata_Lepidochelys_olivacea

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Cheloniidae';
metaData.species    = 'Lepidochelys_olivacea'; 
metaData.species_en = 'Olive ridley sea turtle'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0bTd', 'biMcp'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi', 'biHa'};
metaData.ecoCode.gender  = {'Dtmf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 08 11];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 08 11]; 

%% set data
% zero-variate data

data.ab = 55;      units.ab = 'd';   label.ab = 'age at birth';             bibkey.ab = 'EoL';   
  temp.ab = C2K(30); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '45 till 51 d';
data.ap = 17*365;    units.ap = 'd'; label.ap = 'age at puberty';           bibkey.ap = 'EoL';
  temp.ap = C2K(20); units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 50*365;   units.am = 'd';   label.am = 'life span';                bibkey.am = 'Wiki';   
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 17;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Wiki';
  comment.Wwb = '12.0 and 23.3 g';
data.Wwp = 44900; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'guess';
  comment.Wwp = 'Approximation based on reproductive behavior occuring when physically at ultimate size';
data.Wwi = 40e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';
  comment.Wwi = '25 till 46 kg';

data.Ri  = 130/365/2; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'EoL';   
  temp.Ri = C2K(20); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '120 till 140 eggs per clutch; one clutch each 2 yrs assumed';
  
% uni-variate data
% t-W data
data.tW = [ ... % time since birth (mnth), wet weight (kg)
11.115	1.118
13.050	2.069
15.042	2.778
17.034	4.400
19.055	5.651
19.546	6.395
19.979	7.438
20.499	8.011
21.047	8.699];
data.tW(:,1) = data.tW(:,1) * 30.5; % convert mnth to d
%data.tW(:,1) = data.tW(:,1) - data.tW(1,1); % shift origin
units.tW   = {'d', 'kg'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(28);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'MarkKirk1988';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 5 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 10 * weights.psd.v;
weights.psd.p_M = 10 * weights.psd.p_M;

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
metaData.links.id_CoL = '3TB2H'; % Cat of Life
metaData.links.id_ITIS = '173840'; % ITIS
metaData.links.id_EoL = '46559477'; % Ency of Life
metaData.links.id_Wiki = 'Lepidochelys_olivacea'; % Wikipedia
metaData.links.id_ADW = 'Lepidochelys_olivacea'; % ADW
metaData.links.id_Taxo = '48487'; % Taxonomicon
metaData.links.id_WoRMS = '220293'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Lepidochelys&species=olivacea'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lepidochelys_olivacea}}';
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
bibkey = 'MarkKirk1988'; type = 'article'; bib = [ ... 
'author = {J. Markham and J. K. Kirkwood}, ' ... 
'year = {1988}, ' ...
'title = {Rearing the olve ridley \emph{Lepidochelys olivacea} hand-reared at the {London zoo}}, ' ...
'journal = {Int. Zoo Yb.}, ' ...
'volume = {27}, '...
'pages = {316--319}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib =  ...
'howpublished = {\url{http://eol.org/pages/1056177/details}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

