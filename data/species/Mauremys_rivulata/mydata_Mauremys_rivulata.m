function [data, auxData, metaData, txtData, weights] = mydata_Mauremys_rivulata
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Geoemydidae';
metaData.species    = 'Mauremys_rivulata'; 
metaData.species_en = 'Balkan pond turtle'; 

metaData.ecoCode.climate = {'BSk','Dwa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0bTd', 'biFm', 'biFp', 'biFl', 'biFr'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biH'};
metaData.ecoCode.gender  = {'Dtmf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 05 08];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 05 08];

%% set data
% zero-variate data

data.ab = 95;      units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(31);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on Emys_orbicularis';
data.am = 16.2*365;     units.am = 'd';    label.am = 'life span';                   bibkey.am = 'guess';   
  temp.am = C2K(24);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'value for M. japonica';

data.Lb = 2.6; units.Lb = 'cm';   label.Lb = 'carapace length at birth';                bibkey.Lb = 'guess';
  comment.Lb = 'based on Emys_orbicularis';
data.Lp = 8.57;  units.Lp = 'cm';   label.Lp = 'carapace length at puberty for female';  bibkey.Lp = 'CiceKuma2016';
data.Li = 17.8;  units.Li = 'cm';   label.Li = 'ultimate carapace length for female';   bibkey.Li = 'CiceKuma2016';
data.Lim = 14.9; units.Lim = 'cm';  label.Lim = 'ultimate carapace length for male';  bibkey.Lim = 'CiceKuma2016';

data.Wwi = 632;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female';    bibkey.Wwi = 'guess';
  comment.Wwi = 'based on size-correct value for Mauremys_sinensis: 1750*(17.8/25)^3';

data.Ri  = 8/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';            bibkey.Ri  = 'guess';   
  temp.Ri = C2K(24);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on size-corrected value for Mauremys_sinensis';
 
% uni-variate data

% time-length
data.tL = [ ... % time (d), carapace length (cm)
2.946	9.483
3.951	8.883
3.966	8.694
5.976	7.431
5.985	15.077
7.008	10.858
7.946	16.835
7.947	16.332
7.962	16.080
7.994	14.444
8.953	14.316
9.009	19.287
9.942	14.439
9.943	13.338
9.952	19.820
9.985	17.586
10.988	18.717
10.989	18.150
10.991	15.664
11.003	19.126
11.004	17.489
11.963	17.393
11.965	14.560];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time', 'carapace length'};  
temp.tL    = C2K(24);  units.temp.tL = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL = 'CiceKuma2016';
comment.tL = 'temp is guessed';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

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
D1 = 'Males are assumed to differ from females by {p_Am}  only';   
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '3YFWM'; % Cat of Life
metaData.links.id_ITIS = '949164'; % ITIS
metaData.links.id_EoL = '791487'; % Ency of Life
metaData.links.id_Wiki = 'Mauremys_rivulata'; % Wikipedia
metaData.links.id_ADW = 'Mauremys_rivulata'; % ADW
metaData.links.id_Taxo = '640644'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Mauremys&species=rivulata'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mauremys_rivulata}}';
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
bibkey = 'CiceKuma2016'; type = 'Article'; bib = [ ... 
'doi = {10.1080/09397140.2016.1144277}, ' ...
'author = {Kerim \c{C}i\c{c}ek and Meltem Kuma\c{s} and Din\c{c}er Ayaz and Cemal Varol Tok}, ' ... 
'year = {2016}, ' ...
'title = {A skeletochronological study of age, growth and longevity in two freshwater turtles, \emph{Emys orbicularis} and \emph{Mauremys rivulata}, from {M}editerranean {T}urkey ({R}eptilia: {T}estudines)}, ' ...
'journal = {Zoology in the Middle East}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/791487}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

