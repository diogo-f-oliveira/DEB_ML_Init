function [data, auxData, metaData, txtData, weights] = mydata_Batagur_baska
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Geoemydidae';
metaData.species    = 'Batagur_baska'; 
metaData.species_en = 'Northern river terrapin'; 

metaData.ecoCode.climate = {'Am', 'Aw'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0bTd', 'biFm', 'biFp'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biH'};
metaData.ecoCode.gender  = {'Dtmf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 08 03];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 08 03];

%% set data
% zero-variate data

data.ab = 65;     units.ab = 'd';    label.ab = 'age at birth';      bibkey.ab = 'WeisPrei2015';
  temp.ab = C2K(30);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '59 till 74 d';
data.tp = 7*365;     units.tp = 'd';    label.tp = 'time since birth at puberty';      bibkey.tp = 'ADW';
  temp.tp = C2K(24);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '6 till 8 yr, value for Callagur_borneoensis';
data.am = 21.7*365;     units.am = 'd';    label.am = 'life span';                   bibkey.am = 'AnAge';   
  temp.am = C2K(24);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 35; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';                bibkey.Wwb = 'WeisPrei2015';
data.Wwi = 18e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female';    bibkey.Wwi = 'Wiki';

data.Ri  = 3*18/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';            bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(24);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '10 till 34 eggs/clutch; 3 clutches per yr';

% uni-variate data

% time-length
data.tW = [ ... % time  since birth (mnth), weight (g)
0.951	35.214
1.999	102.935
2.993	121.896
4.016	184.199
5.011	224.831
6.007	260.045
7.001	262.754
8.020	260.045
9.014	243.792
10.008	249.210
11.030	303.386
12.027	381.941
13.026	503.837
14.050	614.898
14.975	774.718
15.999	888.488
16.992	866.817
17.988	912.867];
data.tW(:,1) = data.tW(:,1) * 30.5; % convert mnth to d
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'weight'};  
temp.tW    = C2K(24);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'WeisPrei2015';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.3; units.psd.k = '-'; label.psd.k = 'maintenance ratio';
weights.psd.k = 5 * weights.psd.k_J; weights.psd.k_J = 0;
weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = 'KVXD'; % Cat of Life
metaData.links.id_ITIS = '202097'; % ITIS
metaData.links.id_EoL = '795612'; % Ency of Life
metaData.links.id_Wiki = 'Batagur_baska'; % Wikipedia
metaData.links.id_ADW = 'Batagur_baska'; % ADW
metaData.links.id_Taxo = '48530'; % Taxonomicon
metaData.links.id_WoRMS = '1457593'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Batagur&species=baska'; % ReptileDB
metaData.links.id_AnAge = 'Batagur_baska'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Batagur_baska}}';
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
bibkey = 'WeisPrei2015'; type = 'Article'; bib = [ ... 
'author = {A. Weissenbacher and D. Preininger and R. Ghosh and A. G. J. Morshed and P. Praschag}, ' ... 
'year = {2015}, ' ...
'title = {Conservation breeding of the {N}orthern river terrapin \emph{Batagur baska} at the {V}ienna {Z}oo, {A}ustria, and in {B}angladesh}, ' ...
'journal = {Int. Zoo Yb.}, ' ...
'volume = {49}, ' ...
'doi = {10.1111/izy.12070}, ' ...
'pages = {31-41}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Batagur_baska}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Callagur_borneoensis/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

