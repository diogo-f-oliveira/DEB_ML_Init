function [data, auxData, metaData, txtData, weights] = mydata_Ameiurus_melas
%% set metaData

metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Ictaluridae';
metaData.species    = 'Ameiurus_melas'; 
metaData.species_en = 'Black bullhead'; 

metaData.ecoCode.climate = {'Cfa','Dfa','Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFl','0iFp'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm = [2020 08 02];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 08 02]; 

%% set data
% zero-variate data;

data.ab = 4.5;     units.ab = 'd';    label.ab = 'age at birth';     bibkey.ab = 'ADW';
  temp.ab = C2K(27.8);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 10*365;     units.am = 'd';    label.am = 'life span';     bibkey.am = 'fishbase';
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 45;  units.Lp  = 'cm';	label.Lp  = 'total length at puberty';  bibkey.Lp  = 'CoppTerk2016';
  comment.Lp = 'CoppTerk2016 actually say TL 40-49 mm for females and 70-79 mm for males, but this problably is in cm, rather then mm';
data.Li  = 66;   units.Li  = 'cm';	label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase'; 

data.Wwb = 9.2e-3; units.Wwb = 'g';	label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'CoppTerk2016'; 
  comment.Wwb = 'based on egg diameter of 2.6 mm: pi/6*0.26^3';
data.Wwi  = 3.97e3;   units.Wwi  = 'g';	label.Wwi  = 'ultimate wet weight';    bibkey.Wwi  = 'fishbase'; 
  comment.Wwi = 'based on 0.00871*Li^3.11, see F1';

data.Ri  = 3.8e3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(25); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
0.910	9.682
1.957	16.982
2.979	21.766
3.981	25.886
4.961	28.815
5.940	30.948
6.958	32.553];
data.tL(:,1) = 365 * data.tL(:,1);
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'CoppTerk2016';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: W in g = 0.00871 *(TL in cm)^3.11'; 
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1); 

%% Links
metaData.links.id_CoL = 'CQKD'; % Cat of Life
metaData.links.id_ITIS = '164039'; % ITIS
metaData.links.id_EoL = '204761'; % Ency of Life
metaData.links.id_Wiki = 'Ameiurus_melas'; % Wikipedia
metaData.links.id_ADW = 'Ameiurus_melas'; % ADW
metaData.links.id_Taxo = '160630'; % Taxonomicon
metaData.links.id_WoRMS = '154205'; % WoRMS
metaData.links.id_fishbase = 'Ameiurus-melas'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Ameiurus_melas}}';
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
bibkey = 'CoppTerk2016'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s11160-016-9436-z}, ' ...
'author = {Gordon H. Copp and Ali Serhan Tarkan and G\''{e}rard Masson and Michael J. Godard and J\''{a}n Ko\v{s}\v{c}o and Vladim\''{i}r Kov\''{a}\v{c} and Andrea Novomesk\''{a} and Rafael Miranda and Julien Cucherousset and Giovanni Pedicillo  and Brian G. Blackwell},'...
'title = {A review of growth and life-history traits of native and non-native European populations of black bullhead\emph{ Ameiurus melas}},'...
'journal = {Rev Fish Biol Fisheries}, '...
'volume = {26}, '...
'year = {2016}, '...
'pages = {441-469}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Ameiurus-melas.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Ameiurus_melas/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

