function [data, auxData, metaData, txtData, weights] = mydata_Bufotes_latastii

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Bufonidae';
metaData.species    = 'Bufotes_latastii'; 
metaData.species_en = 'Ladakh toad'; 

metaData.ecoCode.climate = {'Cwa','Cwb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFc','jiTf'};
metaData.ecoCode.embryo  = {'Fc'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lj'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 24];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 24];

%% set data
% zero-variate data

data.ab = 4;    units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '2-5 d';
data.tj = 106;    units.tj = 'd';    label.tj = 'time since birth at metam';   bibkey.tj = 'MatuKido2020';   
  temp.tj = C2K(20);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
  comment.tj = '86 – 125 d';
data.tp = 3*365;    units.tp = 'd';    label.tp = 'time since metam at puberty for female'; bibkey.tp = 'LyapKido2020';
  temp.tp = C2K(20);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 365;    units.tpm = 'd';    label.tpm = 'time since metam at puberty for male';  bibkey.tpm = 'MatuKido2020';
  temp.tpm = C2K(20);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 10*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'LyapKido2020';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 0.8;     units.Lj  = 'cm';  label.Lj  = 'SVL at metam';             bibkey.Lj  = 'amphibiaweb';
  comment.Lj = 'TL 25-27 mm, tail 17-19 mm';
data.Li  = 6.2;   units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'Wiki';
data.Lim  = 5.7; units.Lim  = 'cm'; label.Lim  = 'ultimate SVL for males';     bibkey.Lim  = 'guess';

data.Wwb = 0.0012; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'MatuKido2020';
  comment.Wwb = 'based on egg diameter of 0.8-1.9 mm: pi/6*0.13^3';
data.Wwi = 30;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'MatuKido2020';
data.Wwim = 17;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';   bibkey.Wwim = 'MatuKido2020';

data.Ri  = 8e3/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'MatuKido2020';   
temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '6804-10149 eggs per year'; 

% uni-variate data
% time-length
data.tL_fm = [ ... % time (yr), body length (cm): females, males
    1	2.906 3.028
    2	4.236 4.042
    3	5.092 4.942
    4	5.448 5.140
    5	5.403 5.324
    6	5.501 5.400
    7	5.713 5.248];
data.tL_fm(:,1) = (data.tL_fm(:,1)+0.9) * 365; % convert yr to d since metam
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since metam', 'SVL'};  
temp.tL_fm    = C2K(20); units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'LyapKido2020'; treat.tL_fm = {1, {'females','males'}}; 
comment.tL_fm = 'Data for females, males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 10 * weights.tL_fm;
weights.Li = 3 * weights.Li;
weights.Lim = 3 * weights.Lim;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = 'NPMG'; % Cat of Life
metaData.links.id_ITIS = '1103446'; % ITIS
metaData.links.id_EoL = '46394575'; % Ency of Life
metaData.links.id_Wiki = 'Bufotes_latastii'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '5290246'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Bufotes+latastii'; % AmphibiaWeb
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Bufotes_latastii}}';
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
bibkey = 'LyapKido2020'; type = 'Article'; bib = [ ... 
'doi = {10.30906/1026-2296-2020-27-3-165-171}, ' ...
'author = {Sergey M. Lyapkov and Artem A. Kidov and Irina V. Stepankova and Kirill A. Afrin and Spartak N. Litvinchuk}, ' ... 
'year = {2020}, ' ...
'title = {AGE STRUCTURE AND GROWTH IN THE {L}ATASTE’S TOAD, \emph{Bufotes latastii} ({A}NURA: {B}UFONIDAE)}, ' ...
'journal = {Russian Journal of Herpetology}, ' ...
'volume = {27(3)}, ' ...
'pages = {165–171}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MatuKido2020'; type = 'Article'; bib = [ ... 
'doi = {10.30906/1026-2296-2020-27-5-284-290}, ' ...
'author = {K. A. Matushkina and A. A. Kidov and S. N. Litvinchuk}, ' ... 
'year = {2020}, ' ...
'title = {KEEPING, BREEDING, AND MAINTENANCE OF ZOOCULTURE OF THE {L}ADAKH TOAD, \emph{Bufotes latastii} ({B}OULENGER, 1882)}, ' ...
'journal = {Russian Journal of Herpetology}, ' ...
'volume = {27(5)}, ' ...
'pages = {284 – 290}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/46394575/overview}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Bufotes+latastii}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
