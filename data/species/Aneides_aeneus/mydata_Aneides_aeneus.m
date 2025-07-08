function [data, auxData, metaData, txtData, weights] = mydata_Aneides_aeneus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Plethodontidae';
metaData.species    = 'Aneides_aeneus'; 
metaData.species_en = 'Green salamander'; 

metaData.ecoCode.climate = {'Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFcc', 'jiTf'};
metaData.ecoCode.embryo  = {'Fc'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L-dL'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 02 08];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 02 08];

%% set data
% zero-variate data

data.ab = 82;  units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'AnAge';   
  temp.ab = C2K(12);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.tp = 7.5*365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'WaldPaul2007';   
  temp.tp = C2K(12);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 20*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(12);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am  = 'Anage gives 6.7 yr, but that is less than tp';

data.Lb  = 0.89;   units.Lb  = 'cm';  label.Lb  = 'SVL at birth '; bibkey.Lb  = 'guess'; 
data.Lp  = 4.6;    units.Lp  = 'cm';  label.Lp  = 'SVL at puberty '; bibkey.Lp  = 'WaldPaul2007'; 
data.Li  = 7.1;    units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'WaldPaul2007';

data.Wwb = 0.0141;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 3 mm: pi/6*0.3^3';
data.Wwi = 7.2;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'guess';
  comment.Wwi = 'based on size-corrected value for Desmognathus quadramaculatus: (7.1/9)^3*14.6';

data.Ri  = 2*21/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(12);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '21 eggs per clutch, 2 clutches each yr';

% univariate data
% time-length
data.LdL = [ ... % SVL (cm), persent change in SVL (%/d)
2.191	0.138
2.716	0.103
2.751	0.166
2.935	0.137
3.033	0.040
3.386	0.068
3.827	0.088
3.846	0.072
4.015	0.103
4.193	0.081
4.471	0.060
4.888	0.049
4.933	0.030
5.078	0.012
5.153	0.053
5.210	0.030
5.489	0.012
5.596	0.016
5.708	0.058];
data.LdL(:,2) = data.LdL(:,2)/100; % convert percent/d to fraction/d
units.LdL  = {'cm', '1/d'}; label.LdL = {'SVL', 'fraction change in SVL'};  
temp.LdL  = C2K(12); units.temp.LdL = 'K'; label.temp.LdL = 'temperature';
bibkey.LdL = 'WaldPaul2007';

%% set weights for all real data
weights = setweights(data, []);
weights.LdL = 3 * weights.LdL;
weights.Lp = 0 * weights.Lp;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'Terrestrial reproduction, direct divelopment';
metaData.bibkey.F1 = 'amphibiaweb'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'DW55'; % Cat of Life
metaData.links.id_ITIS = '173699'; % ITIS
metaData.links.id_EoL = '331354'; % Ency of Life
metaData.links.id_Wiki = 'Aneides_aeneus'; % Wikipedia
metaData.links.id_ADW = 'Aneides_aeneus'; % ADW
metaData.links.id_Taxo = '47438'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Aneides+aeneus'; % AmphibiaWeb
metaData.links.id_AnAge = 'Aneides_aeneus'; % Anage

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Aneides_aeneus}}';
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
bibkey = 'WaldPaul2007'; type = 'Article'; bib = [ ... 
'author = {Jayme L. Waldron and Thomas K. Pauley}, ' ... 
'year = {2007}, ' ...
'title = {Green Salamander (\emph{Aneides aeneus}) Growth and Age at Reproductive Maturity}, ' ...
'journal = {Journal of Herpetology}, ' ...
'volume = {41(4)}, ' ...
'pages = {638-644}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Aneides+aeneus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\urlhttps://genomics.senescence.info/species/entry.php?species=Aneides_aeneus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

