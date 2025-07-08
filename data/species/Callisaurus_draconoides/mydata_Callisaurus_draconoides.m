function [data, auxData, metaData, txtData, weights] = mydata_Callisaurus_draconoides
%% set metaData
metaData.phylum     = 'Chordata';
metaData.class      = 'Reptilia';
metaData.order      = 'Squamata';
metaData.family     = 'Phrynosomatidae';
metaData.species    = 'Callisaurus_draconoides';
metaData.species_en = 'Zebra-tailed lizard';

metaData.ecoCode.climate = {'BWh'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTht'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L_f'; 'L-N_f'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 09];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 09];

%% set data
% zero-variate data;
data.ab = 50;  units.ab = 'd';      label.ab = 'age at birth';             bibkey.ab = 'guess';
temp.ab = C2K(20); units.temp.ab = 'K'; label.temp.ab = 'temperature';
comment.ab = 'based on Liopholis_striata with temp correction';
data.am = 10*365;     units.am = 'd'; label.am = 'life span';               bibkey.am = 'guess';
temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature';
comment.am = 'based on Liopholis_striata';

data.Lb  = 2.9;     units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'PianPark1972';
  comment.Lb = '2.6-3.2 cm';
data.Lp  = 6.5;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females'; bibkey.Lp  = 'PianPark1972';
data.Lpm  = 6.7;    units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males'; bibkey.Lpm  = 'PianPark1972';
data.Li  = 8.7; units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'PianPark1972';
data.Lim  = 9.9; units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males';   bibkey.Lim  = 'PianPark1972';

data.Wwi = 12.9; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'EoL';

data.Ri  = 73/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'PianPark1972';
temp.Ri = C2K(25); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2-8 eggs per clutch, 4.4 clutches per yr';

% uni-variate data
% length - change in length
data.LdL = [... % SVL (cm), change in SVL (cm/d)
   4.1 0.032 % m
   4.0 0.020 % f
   4.3 0.029 % f
   4.9 0.028 % f
   5.1 0.012 % f
   3.7 0.022 % f
   5.5 0.006]; % f
units.LdL  = {'cm', 'cm/d'};  label.LdL = {'SVL', 'change in SVL'};  
temp.LdL   = C2K(25);  units.temp.LdL = 'K'; label.temp.LdL = 'temperature';
bibkey.LdL = 'PianPark1972';

%% set weights for all real data
weights = setweights(data, []);
weights.LdL = 3 * weights.LdL;
weights.Li = 5 * weights.Li;
weights.Lb = 5 * weights.Lb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = 'PT6B'; % Cat of Life
metaData.links.id_ITIS = '173906'; % ITIS
metaData.links.id_EoL = '964171'; % Ency of Life
metaData.links.id_Wiki = 'Callisaurus_draconoides'; % Wikipedia
metaData.links.id_ADW = 'Callisaurus_draconoides'; % ADW
metaData.links.id_Taxo = '49004'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Callisaurus&species=draconoides'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Callisaurus_draconoides}}';   
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
bibkey = 'PianPark1972'; type = 'Article'; bib = [ ...  
'author = {Eric R. Pianka and William S. Parker}, ' ...
'title = {Ecology of the {I}guanid Lizard \emph{Callisaurus draconoides}}, ' ...
'journal = {Copeia}, ' ...
'volume = {1972(3)}, ' ...
'pages = {493-508}, ' ...
'year = {1972}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/964171}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

