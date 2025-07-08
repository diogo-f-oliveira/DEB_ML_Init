function [data, auxData, metaData, txtData, weights] = mydata_Bufotes_zamdaensis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Bufonidae';
metaData.species    = 'Bufotes_zamdaensis'; 
metaData.species_en = 'Zamda toad'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFc','jiTf'};
metaData.ecoCode.embryo  = {'Fc'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(8); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lj'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 31];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 31];

%% set data
% zero-variate data

data.ab = 50;    units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(8);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '2-5 d';
data.tp = 5*365;    units.tp = 'd';    label.tp = 'time since metam at puberty for female'; bibkey.tp = 'LyapKido2021';
  temp.tp = C2K(8);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 4*365;    units.tpm = 'd';    label.tpm = 'time since metam at puberty for male';  bibkey.tpm = 'LyapKido2021';
  temp.tpm = C2K(8);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 9*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'LyapKido2021';   
  temp.am = C2K(8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 0.8;     units.Lj  = 'cm';  label.Lj  = 'SVL at metam';             bibkey.Lj  = 'guess';
  comment.Lj = 'based on Bufotes_latastii';
data.Li  = 6.2;   units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'LyapKido2021';
data.Lim  = 6.0; units.Lim  = 'cm'; label.Lim  = 'ultimate SVL for males';     bibkey.Lim  = 'LyapKido2021';

data.Wwb = 0.0012; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8-1.9 mm of Bufotes_latastii: pi/6*0.13^3';
data.Wwi = 30;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'guess';
  comment.Wwi = 'based on Bufotes_latastii';
data.Wwim = 17;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';   bibkey.Wwim = 'guess';
  comment.Wwim = 'based on Bufotes_latastii';

data.Ri  = 8e3/3/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';   
temp.Ri = C2K(8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Bufotes_latastii, tmep corrected'; 

% uni-variate data
% time-length
data.tL_fm = [ ... % time (yr), body length (cm): females, males
1	3.588 3.969
2	4.310 4.589
3	4.867 5.184
4	5.437 5.697
5	5.893 5.905
6	5.835 6.171
7	6.087 6.449];
data.tL_fm(:,1) = (data.tL_fm(:,1)+0.9) * 365; % convert yr to d since metam
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since metam', 'SVL'};  
temp.tL_fm    = C2K(20); units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'LyapKido2021'; treat.tL_fm = {1, {'females','males'}}; 
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

%% Facts
F1 = 'Tripoid species that lives in Himachal Pradesh State at 2827 – 5000 m alt';
metaData.bibkey.F1 = 'LyapKido2021'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'NPMT'; % Cat of Life
metaData.links.id_ITIS = '1103626'; % ITIS
metaData.links.id_EoL = '45860245'; % Ency of Life
metaData.links.id_Wiki = 'Bufotes'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '5290257'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = ''; % AmphibiaWeb
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Bufotes}}';
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
bibkey = 'LyapKido2021'; type = 'Article'; bib = [ ... 
'doi = {10.30906/1026-2296-2021-28-3-138-144}, ' ...
'author = {Sergey M. Lyapkov and Artem A. Kidov and Irina V. Stepankova and Kirill A. Afrin and Spartak N. Litvinchuk}, ' ... 
'year = {2021}, ' ...
'title = {AGE STRUCTURE AND GROWTH IN THE {Z}AMDA TOAD, \emph{Bufotes zamdaensis} ({A}NURA, {B}UFONIDAE)}, ' ...
'journal = {Russian Journal of Herpetology}, ' ...
'volume = {28(3)}, ' ...
'pages = {138-144}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/45860245/overview}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
