function [data, auxData, metaData, txtData, weights] = mydata_Modiolus_modiolus

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Myida'; 
metaData.family     = 'Mytilidae';
metaData.species    = 'Modiolus_modiolus'; 
metaData.species_en = 'Northern horsemussel'; 

metaData.ecoCode.climate = {'MC','ME'};
metaData.ecoCode.ecozone = {'MN','MAN','MAW','MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wdi'; 'GRi'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2021 02 28];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 02 28]; 

%% set data
% zero-variate data

data.am = 50*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'marlin';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'max age exceeds 50 yr';

data.Lp  = 4;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'SeedBrow1978';
data.Li  = 22;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Wiki';

data.Wwb = 2.8e-7;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'WongArsh2013';
  comment.Wwb = 'based on egg diameter of 81 mum: pi/6*0.0081^3';
data.Wwi = 897;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'sealifebase';
  comment.Wwi = 'Based on 10^(-3.716 + 2.847*log10(10*Li)), see F1';

data.Ri  = 3.7e6/365;   units.Ri  = '#/d'; label.Ri  = 'reproduction rate at SL 8.1 cm'; bibkey.Ri  = 'WongArsh2013';   
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'value for Modiolus philippinarum';
 
% uni-variate data
% t-L data
data.tL = [ ... % time since birth (yr), length (cm)
0.898	1.783
2.057	2.511
3.904	4.013
5.845	5.539
9.928	8.005
13.981	9.767
18.000	10.943
22.072	11.884
26.105	12.474
30.100	12.712];
data.tL(:,1) = 365 * (0.5 + data.tL(:,1)); % convert yr to d 
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
temp.tL    = C2K(15);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'SeedBrow1978';
comment.tL = 'Sata from Strangford Lough, North Ireland';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 20 * weights.tL; 

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.5; units.psd.k = '-'; label.psd.k = 'maintenance rate coeffcient';
weights.psd.k = 3; 
weights.psd.v = 3 * weights.psd.v; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'length-weight: soft-tissue log10(Ww in g) = -3.716 + 2.847*log10(shell length in mm)';
metaData.bibkey.F1 = 'BaguRich2013'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '43TSC'; % Cat of Life
metaData.links.id_ITIS = '79501'; % ITIS
metaData.links.id_EoL = '46466768'; % Ency of Life
metaData.links.id_Wiki = 'Modiolus_modiolus'; % Wikipedia
metaData.links.id_ADW = 'Modiolus_modiolus'; % ADW
metaData.links.id_Taxo = '39212'; % Taxonomicon
metaData.links.id_WoRMS = '140467'; % WoRMS
metaData.links.id_molluscabase = '140467'; % MolluscaBase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Modiolus_modiolus}}';
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
bibkey = 'SeedBrow1978'; type = 'Article'; bib = [ ... 
'author = {R. Seed and R. A. Brown}, ' ... 
'year = {1978}, ' ...
'title = {Growth as a Strategy for Survival in two Marine Bivalves, \emph{Cerastoderma edule} and \emph{Modiolus modiolus}}, ' ...
'journal = {Journal of Animal Ecology}, ' ...
'volume = {47}, ' ...
'pages = {283-292}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WongArsh2013'; type = 'Article'; bib = [ ... 
'doi = {10.3923/ajava.2013.100.107}, ' ...
'author = {Nur Leena Wong and Aziz Arshad}, ' ... 
'year = {2013}, ' ...
'title = {Induced Spawning and Early Development of \emph{Modiolus philippinarum} ({H}anley, 1843) ({B}ivalvia: {M}ytilidae)}, ' ...
'journal = {Asian Journal of Animal and Veterinary Advances}, ' ...
'volume = {8}, ' ...
'pages = {100-107}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'marlin'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.marlin.ac.uk/biotic/browse.php?sp=4302}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

