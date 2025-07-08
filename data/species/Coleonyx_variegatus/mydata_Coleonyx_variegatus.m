function [data, auxData, metaData, txtData, weights] = mydata_Coleonyx_variegatus
%% set metaData
metaData.phylum     = 'Chordata';
metaData.class      = 'Reptilia';
metaData.order      = 'Squamata';
metaData.family     = 'Eublepharidae';
metaData.species    = 'Coleonyx_variegatus';
metaData.species_en = 'Western banded gecko';

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
data.ab = 30;  units.ab = 'd';      label.ab = 'age at birth';             bibkey.ab = 'Park1972';
  temp.ab = C2K(25); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 15.2*365;     units.am = 'd'; label.am = 'life span';               bibkey.am = 'AnAge';
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 2.4;     units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Park1972';
data.Lp  = 5.2;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females'; bibkey.Lp  = 'Park1972';
data.Li  = 7.0; units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'Park1972';
data.Lim  = 6.6; units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males';   bibkey.Lim  = 'Park1972';

data.Wwi = 9.46; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'EoL';

data.Ri  = 4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'Park1972';
temp.Ri = C2K(25); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 eggs per clutch, 2 clutches per yr';

% uni-variate data
% length - change in length
data.LdL = [... % SVL (cm), change in SVL (cm/mnth)
   3.5 0.864 % 
   4.0 0.483 % m
   4.0 0.477 % f
   5.5 0.071 % m
   5.5 0.228 % f
   6.1 0.063 % m
   6.3 0.059]; % f
data.LdL(:,2) = data.LdL(:,2)/30.5; % convert cm/mnth to cm/d
units.LdL  = {'cm', 'cm/d'};  label.LdL = {'SVL', 'change in SVL'};  
temp.LdL   = C2K(25);  units.temp.LdL = 'K'; label.temp.LdL = 'temperature';
bibkey.LdL = 'Park1972';

%% set weights for all real data
weights = setweights(data, []);
weights.LdL = 3 * weights.LdL;
weights.Li = 10 * weights.Li;
weights.Lb = 5 * weights.Lb;
weights.Lp = 10 * weights.Lp;

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
metaData.links.id_CoL = 'WY28'; % Cat of Life
metaData.links.id_ITIS = '174041'; % ITIS
metaData.links.id_EoL = '963840'; % Ency of Life
metaData.links.id_Wiki = 'Coleonyx_variegatus'; % Wikipedia
metaData.links.id_ADW = 'Coleonyx_variegatus'; % ADW
metaData.links.id_Taxo = '48861'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Coleonyx&species=variegatus'; % ReptileDB
metaData.links.id_AnAge = 'Coleonyx_variegatus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Coleonyx_variegatus}}';   
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
bibkey = 'Park1972'; type = 'Article'; bib = [ ...  
'author = {William S. Parker}, ' ...
'title = {Aspects of the Ecology of a {S}onoran {D}esert Population of the Western Banded Gecko, \emph{Coleonyx variegatus} ({S}auria, {E}ublepharinae)}, ' ...
'journal = {The American Midland Naturalist}, ' ...
'volume = {88(1)}, ' ...
'pages = {209-224}, ' ...
'year = {1972}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/963840}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Coleonyx_variegatus}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

