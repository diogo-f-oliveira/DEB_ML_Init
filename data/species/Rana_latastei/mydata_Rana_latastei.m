function [data, auxData, metaData, txtData, weights] = mydata_Rana_latastei

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Ranidae';
metaData.species    = 'Rana_latastei'; 
metaData.species_en = 'Italian agile frog';

metaData.ecoCode.climate = {'Cfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFp', 'jiTf'};
metaData.ecoCode.embryo  = {'Fpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjO', 'jiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 26];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 26];

%% set data
% zero-variate data

data.ab = 12;  units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'Wiki';   
  temp.ab = C2K(7);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
  comment.ab = '10-15 d';
data.tj = 2.5*30.5;  units.tj = 'd';    label.tj = 'time since birth at metam'; bibkey.tj = 'Wiki';
  temp.tj = C2K(7);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.tp = 2*365;  units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'Wiki';
  temp.tp = C2K(7);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 2*365;  units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'Wiki';
  temp.tpm = C2K(7);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 5*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'Wiki';   
  temp.am = C2K(10);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 1.3;    units.Lj  = 'cm';  label.Lj  = 'SVL at metam';   bibkey.Lj  = 'Wiki';
  comment.Li = '1.3-1.5 cm';
data.Lp  = 3.5;    units.Lp  = 'cm';  label.Lp  = ' SVL at puberty';   bibkey.Lp  = 'GuarLuna2003';
data.Li  = 7.5;    units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'Wiki';
data.Lim  = 7.3;    units.Lim  = 'cm';  label.Lim  = 'ultimate SVL for males';   bibkey.Lim  = 'guess';
  comment.Lim = 'based on the remark that males are slightly smaller than males';

data.Wwb = 0.0042;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'guess based on egg diameter of 2 mm: pi/6*0.2^3';
data.Wwi = 39.5;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'EoL';
  comment.Wwi = 'based on SVL 6.5 cm weighs 25.7 g: (7.5/6.5)^3*25.7';
data.Wwim = 36.4;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'guess';
  comment.Wwi = 'based on SVL 6.5 cm weighs 25.7 g: (7.3/6.5)^3*25.7';

data.Ri  = 1278/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '676-2720 eggs per clutch, 1 clutch per yr';
  
% univariate data
% time-length data
data.tL_fm = [ ... % time since metam (yr), SVL (cm): females, males
    1	3.537 3.545
    2	4.747 4.292
    3	5.374 4.944
    4	5.614 NaN];
data.tL_fm(:,1) = (data.tL_fm(:,1) + 0.8) * 365; % convert yr since birth to d since puberty
units.tL_fm  = {'d', 'cm'};  label.tL_fm = {'time since metam', 'SVL'};  
temp.tL_fm   = C2K(15);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'GuarLuna2003'; treat.tL_fm = {1, {'females','males'}};
comment.tL_fm = 'Data for females, males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.v = 2 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Links
metaData.links.id_CoL = '79366'; % Cat of Life
metaData.links.id_ITIS = '1106561'; % ITIS
metaData.links.id_EoL = '1019688'; % Ency of Life
metaData.links.id_Wiki = 'Rana_latastei'; % Wikipedia
metaData.links.id_ADW = 'Rana_latastei'; % ADW
metaData.links.id_Taxo = '47642'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Rana+latastei'; % AmphibiaWeb
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rana_latastei}}';
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
bibkey = 'GuarLuna2003'; type = 'Article'; bib = [ ... 
'author = {Fabio M. Guarino and Silvia Lunardi and Michela Carlomagno and Stefano Mazzotti}, ' ... 
'year = {2003}, ' ...
'title = {A skeletochronological study of growth, longevity, and age at sexual maturity in a population of \emph{Rana latastei} ({A}mphibia, {A}nura)}, ' ...
'journal = {J. Biosci.}, ' ...
'volume = {28(6)}, ' ...
'pages = {775–782}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Rana+latastei}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

